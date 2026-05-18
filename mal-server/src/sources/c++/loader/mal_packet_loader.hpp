//
//  mal_packet_loader.hpp
//  Demo
//
//  Created by wangyaqiang on 2024/12/11.
//

#ifndef mal_packet_loader_hpp
#define mal_packet_loader_hpp

#include <stdio.h>
#include "../datasource/mal_idatasource.h"
#include "../parser/mal_atom.h"
#include "../parser/mal_codec_parser.h"
namespace mal {
class MALPacketLoader {
public:
    explicit MALPacketLoader(std::shared_ptr<MALFormatContext> fmtCtx, int streamIndex):fmtCtx_(fmtCtx), streamIndex_(streamIndex){
        parser_ = std::make_shared<MALCodecParser>(fmtCtx,streamIndex);
        stream_ = fmtCtx->streams[streamIndex];
    }
   
    virtual ~MALPacketLoader() {
        std::cout << "MALPacketLoader release" << std::endl;
        std::lock_guard<std::mutex> lock(video_dec_mtx);
        decode_frames_.clear();
        std::unordered_map<int64_t, std::shared_ptr<MALFrame>> emptyMap;
        decode_frames_.swap(emptyMap);
        
        for (auto pkt : ff_pkts_) {
            av_packet_free(&pkt);
        }
        ff_pkts_.clear();
        ff_pkts_.shrink_to_fit();
        
    }
    virtual std::vector<std::shared_ptr<MALPacket>> loadPackets(int size) = 0;
    
    virtual std::shared_ptr<MALFrame> loadOneFrameDetail(int64_t pos) {
        std::lock_guard<std::mutex> lock(video_dec_mtx);
        if (pos <= 0 && decode_frames_.size() == 1) {
            auto it = decode_frames_.begin();
            it->second->get_detail_info();
            return it->second;
        }
        if (decode_frames_.contains(pos)) {
            decode_frames_[pos]->get_detail_info();
            return decode_frames_[pos];
        }
        return nullptr;
    }
    virtual std::vector<std::shared_ptr<MALFrame>> loadFrames(int start,int size) {
        std::lock_guard<std::mutex> lock(video_dec_mtx);
        createDecodeContext();
        decode_frames_.clear();
        if (!stream_->dec_ctx) {
            return {};
        }
        std::unordered_map<int64_t, std::shared_ptr<MALFrame>> emptyMap;
        decode_frames_.swap(emptyMap);
        std::vector<std::shared_ptr<MALFrame>> frames;
        loadFFPackets(start,size+100);//多加载一些
        if (stream_->dec_ctx) {
            int index = 0;
            int key_index = 0;
            while(index < start && index < ff_pkts_.size()) {
                if (ff_pkts_[index]->flags & AV_PKT_FLAG_KEY) {
                    key_index = index;
                }
                index++;
            }
            int ret = 0;
            while (key_index < start + size + 20) {
                AVFrame *ff_frame = av_frame_alloc();
                while ((ret = avcodec_receive_frame(stream_->dec_ctx, ff_frame)) >= 0) {
                    auto frame = std::make_shared<MALFrame>();
                    frame->set_ff_frame(ff_frame, ffstream_->codecpar->codec_type);
                    frames.push_back(frame);
                    decode_frames_[ff_frame->pkt_pos] = frame;
                    ff_frame = av_frame_alloc();
                }
                av_frame_free(&ff_frame);
                if (ret == AVERROR_EOF) {
                    dec_eof = true;
                    break;
                }
                AVPacket *pkt = nullptr;
                if (key_index < ff_pkts_.size()) {
                    pkt = ff_pkts_[key_index];
                }
                avcodec_send_packet(stream_->dec_ctx, pkt);
                key_index++;
            }
        }
        return frames;
    };
    std::shared_ptr<IDataSource> datasource() {
        return datasource_;
    }
protected:
    void createDecodeContext() {
        if (dec_eof) {
            avcodec_free_context(&stream_->dec_ctx);
            stream_->dec_ctx = nullptr;
        }
        if (!stream_->dec_ctx) {
            if (fmtCtx_ && fmtCtx_->ff_fmt_ctx && streamIndex_ < fmtCtx_->ff_fmt_ctx->nb_streams) {
                ffstream_ = fmtCtx_->ff_fmt_ctx->streams[streamIndex_];
                const AVCodec *codec = avcodec_find_decoder(ffstream_->codecpar->codec_id);
                if (codec) {
                    stream_->dec_ctx = avcodec_alloc_context3(codec);
                    avcodec_parameters_to_context(stream_->dec_ctx, ffstream_->codecpar);
                    int ret = avcodec_open2(stream_->dec_ctx, nullptr, nullptr);
                }
            }
        }
        dec_eof = false;
    }
    void loadFFPackets(int start, int size) {
        if (ff_pkt_read_eof_) return;
        if(ff_pkts_.size() > (start + size)) return;
        while(!ff_pkt_read_eof_ && ff_pkts_.size() < (start + size)) {
            AVPacket *pkt = av_packet_alloc();
            int ret = av_read_frame(fmtCtx_->ff_fmt_ctx, pkt);
            if (ret < 0) { //包括失败
                ff_pkt_read_eof_ = true;
                break;
            }
            if (pkt->stream_index == streamIndex_) {
                ff_pkts_.push_back(pkt);
            }
            
        }
        
    }
    std::mutex video_dec_mtx;
    int streamIndex_ = 0;
    bool dec_eof = false;
    std::shared_ptr<MALFormatContext> fmtCtx_ = nullptr;
    std::shared_ptr<IDataSource> datasource_ = nullptr;
//    MALMediaType mediaType_ = MALMediaType::video;
    int error_ = 0;
    std::shared_ptr<MALCodecParser> parser_ = nullptr;
    std::shared_ptr<MALStream> stream_ = nullptr;
    AVStream *ffstream_ = nullptr;
    std::vector<AVPacket *> ff_pkts_;
    bool ff_pkt_read_eof_ = false;
    std::unordered_map<int64_t, std::shared_ptr<MALFrame>> decode_frames_;
    
};
};
#endif /* mal_packet_loader_hpp */
