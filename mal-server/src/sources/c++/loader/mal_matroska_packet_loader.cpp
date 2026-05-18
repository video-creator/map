//
//  mal_matroska_packet_loader.cpp
//  Demo
//
//  Created by wangyaqiang on 2025/10/21.
//

#include "mal_matroska_packet_loader.hpp"
MALMatroskaLoader::MALMatroskaLoader(std::shared_ptr<MALFormatContext> fmtCtx, int streamIndex): MALPacketLoader(fmtCtx, streamIndex) {
    if (streamIndex < fmtCtx->streams.size()) {
        stream_ = std::dynamic_pointer_cast<MALMatroskaStream>(fmtCtx->streams[streamIndex]);
    }
}

std::vector<std::shared_ptr<MALPacket>> MALMatroskaLoader::loadPackets(int size) {
    std::vector<std::shared_ptr<MALPacket>> list = {};
    int end = currentIndex_ + size;
    for (int i = currentIndex_; i < end && i < stream_->blocks.size(); i ++) {
        auto block = stream_->blocks[i];
        fmtCtx_->datasource->seekBytes(block->pos, SEEK_SET);
        auto packet = std::make_shared<MALPacket>(fmtCtx_->datasource->readBytesRaw(block->size), block->size);
        packet->proto_packet.set_index(stream_->proto_stream.index());
        packet->proto_packet.set_pos(block->pos);
        packet->proto_packet.set_number(currentIndex_);
        packet->proto_packet.set_sample_description_index(1);
        if (parser_) {
            parser_->parse_packet(packet);
        }
        currentIndex_ ++;
        list.push_back(packet);
    }
    
    return list;
}
