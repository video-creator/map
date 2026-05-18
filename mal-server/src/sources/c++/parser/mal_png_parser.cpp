//
//  mal_webp_parser.cpp
//  Demo
//
//  Created by wangyaqiang on 2024/11/11.
//

#include "mal_png_parser.hpp"
#include "../../utils/mal_string.hpp"
#include "../deps/spdlog/spdlog.h"
#include "loader/mal_ff_packet_loader.hpp"
using namespace mal;
MALPNGParser::MALPNGParser(const std::shared_ptr<IDataSource>& datasource):IParser(datasource) {
    
}
MALPNGParser::MALPNGParser(const std::string& path, Type type):IParser(path, type) {
}
int png_read_ihdr(void *opaque, std::shared_ptr<MALAtom> parent, std::shared_ptr<MALAtom> box) {
    if(opaque == nullptr) {
        return -1;
    }
    MALPNGParser *parser = (MALPNGParser *)(opaque);
    box->writeField("Width", 32);
    box->writeField("Height", 32);
    box->writeField("Bit depth", 8);
    box->writeField("Color type", 8);
    box->writeField("Compression method", 8);
    box->writeField("Filter method", 8);
    box->writeField("Interlace method", 8);
    return 0;
}
int png_read_chrm(void *opaque, std::shared_ptr<MALAtom> parent,std::shared_ptr<MALAtom> box) {
    if(opaque == nullptr) {
        return -1;
    }
    MALPNGParser *parser = (MALPNGParser *)(opaque);
    
    box->writeField(fmt::format("white_point_x({}bits) * 100000",32), 32);
    box->writeField(fmt::format("white_point_y({}bits) * 100000",32), 32);
    box->writeField(fmt::format("red_x({}bits) * 100000",32), 32);
    box->writeField(fmt::format("red_y({}bits) * 100000",32), 32);
    box->writeField(fmt::format("green_x({}bits) * 100000",32), 32);
    box->writeField(fmt::format("green_y({}bits) * 100000",32), 32);
    box->writeField(fmt::format("blue_x({}bits) * 100000",32), 32);
    box->writeField(fmt::format("blue_y({}bits) * 100000",32), 32);
    return 0;
}
int png_read_gama(void *opaque, std::shared_ptr<MALAtom> parent, std::shared_ptr<MALAtom> box) {
    if(opaque == nullptr) {
        return -1;
    }
    box->writeField(fmt::format("gama({}bits) * 100000",32), 32);
    return 0;
}

int png_read_fctl(void *opaque, std::shared_ptr<MALAtom> parent, std::shared_ptr<MALAtom> box) {
    if(opaque == nullptr) {
        return -1;
    }
    MALPNGParser *parser = (MALPNGParser *)(opaque);
    parser->getFormatContext()->proto_context.set_name("APNG");
    box->writeField("sequence_number", 32);
    box->writeField("width", 32);
    box->writeField("height", 32);
    box->writeField("x_offset", 32);
    box->writeField("y_offset", 32);
    box->writeField("delay_num", 16);
    box->writeField("delay_den", 16);
    box->writeField("dispose_op", 8);
    
    // ‘dispose_op’ 的有效值为：

    //         值
    //     0 APNG_DISPOSE_OP_NONE
    //     1 APNG_DISPOSE_OP_BACKGROUND
    //     2 APNG_DISPOSE_OP_PREVIOUS
    // APNG_DISPOSE_OP_NONE：在渲染下一帧之前不对此帧进行任何处理；输出缓冲区的内容保持原样。
    // APNG_DISPOSE_OP_BACKGROUND：在渲染下一帧之前，该帧的输出缓冲区区域将被清除为完全透明的黑色。
    // APNG_DISPOSE_OP_PREVIOUS：在渲染下一帧之前，该帧的输出缓冲区区域将恢复为以前的内容。
    // 如果第一个“fcTL”块使用“dispose_op”APNG_DISPOSE_OP_PREVIOUS，则应将其视为 APNG_DISPOSE_OP_BACKGROUND。

    // `blend_op` 指定帧是否要与当前输出缓冲区内容进行 alpha 混合，或者是否应该完全替换输出缓冲区中的区域。

    // `blend_op` 的有效值为：

    //             值
    //     0 APNG_BLEND_OP_SOURCE
    //     1 APNG_BLEND_OP_OVER
    box->writeField("blend_op", 8);
    return 0;
}

int png_read_actl(void *opaque, std::shared_ptr<MALAtom> parent, std::shared_ptr<MALAtom> box) {
    if(opaque == nullptr) {
        return -1;
    }
    box->writeField("num_frames", 32);
    box->writeField("num_plays", 32);
    return 0;
}
static const ParseTableEntry png_default_parse_table[] = {
{ "IHDR", png_read_ihdr },
{ "cHRM", png_read_chrm },
{ "gAMA", png_read_gama },
    //apng
{ "fcTL", png_read_fctl },
{ "acTL", png_read_actl },
{ "", NULL }
};
int MALPNGParser::startParse() {
    int ret = 0;
    malFormatContext_->proto_context.set_name("PNG");
    malFormatContext_->root_atom = std::make_shared<MALAtom>();
    malFormatContext_->root_atom->name = "root";
    malFormatContext_->root_atom->dataSource = _datasource;
    malFormatContext_->root_atom->size = _datasource->totalSize();
    malFormatContext_->root_atom->pos = 0;
    _datasource->skipBytes(8);//跳过头
    while (!_datasource->isEof()) {
        ret = _parseChunk(malFormatContext_->root_atom);
    }
    auto stream = std::make_shared<MALStream>();
    stream->proto_stream.set_index(0);
    stream->proto_stream.set_media_type(proto::MAL_MEDIA_TYPE_VIDEO);
    stream->proto_stream.set_video_codec(proto::MAL_VIDEO_CODEC_PNG);
    malFormatContext_->addStream(stream);
    pktLoaders[0] = std::make_shared<MALFFPacketLoader>(malFormatContext_, 0);
    return 0;
}
int MALPNGParser::_parseChunk(std::shared_ptr<MALAtom> parent) {
    int ret = 0;
    auto datasource = parent->dataSource;
    std::shared_ptr<MALAtom> atom = std::make_shared<MALAtom>();
    atom->pos = datasource->currentBytesPosition() + parent->pos;
    uint64_t length = datasource->readBytesInt64(4);
    atom->size = length + 4 + 4 + 4; //这个length 不包含Length、Chunk Type、CRC
    if(atom->size == 0 || datasource->isEof()) {
        return 0;
    }
    if(atom->pos + atom->size > parent->pos + parent->size) {
        return 0;
    }
    atom->name = datasource->readBytesString(4);
    datasource->seekBytes(-8,SEEK_CUR);
    atom->dataSource = datasource->readBytesStream(atom->size);
    int64_t x = datasource->currentBytesPosition();
    atom->writeField("Length", 32);
    atom->writeField<std::string>("Chunk Type", 32);
    int (*parse)(void *opaque, std::shared_ptr<MALAtom> parent, std::shared_ptr<MALAtom> box) = nullptr;
    for(int i = 0; png_default_parse_table[i].type.length(); i++) {
        if(png_default_parse_table[i].type == atom->name) {
            parse = png_default_parse_table[i].parse;
            break;
        }
    }
    if (parse) {
        parse(this,parent, atom);
    }
    parent->childBoxs.push_back(atom);
    return ret;
}
bool MALPNGParser::supportFormat() {
    if (_datasource->totalSize() < 8) return false;
    int64_t cur = _datasource->currentBytesPosition();
    int file_signature[8] = {137,80,78,71,13,10,26,10}; //png file signature
    bool ret = true;
    for(int i = 0; i < 8; i++) {
        if (_datasource->readBytesInt64(1) != file_signature[i]) {
            ret = false;
            goto end;
        }
    }
end:
    _datasource->seekBytes(cur,SEEK_SET);
    return ret;
    
}


