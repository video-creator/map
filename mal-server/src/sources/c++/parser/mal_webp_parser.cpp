//
//  mal_webp_parser.cpp
//  Demo
//
//  Created by wangyaqiang on 2024/11/11.
//

#include "mal_webp_parser.hpp"
#include "../../utils/mal_string.hpp"
#include "loader/mal_ff_packet_loader.hpp"
using namespace mal;
WEBPParser::WEBPParser(const std::shared_ptr<IDataSource>& datasource):IParser(datasource) {
    
}
WEBPParser::WEBPParser(const std::string& path, Type type):IParser(path, type) {
    registerParserTableEntry_();
}
int WEBPParser::startParse() {
    int ret = 0;
    ret = _parseAtom();
    return 0;
}

bool WEBPParser::supportFormat() {
    if (_datasource->totalSize() < 8) return false;
    if (_datasource->readBytesString(4,true) == "RIFF") {
        return true;
    }
    return false;
}
int WEBPParser::_parseAtom() {
    int ret = 0;
    malFormatContext_->root_atom = std::make_shared<MALAtom>();
    malFormatContext_->root_atom->name = "root";
    malFormatContext_->root_atom->dataSource = _datasource;
    malFormatContext_->root_atom->size = _datasource->totalSize();
    malFormatContext_->root_atom->pos = 0;
    malFormatContext_->proto_context.set_name("WEBP");
    _parseChildAtom(malFormatContext_->root_atom);
    auto stream = std::make_shared<MALStream>();
    stream->proto_stream.set_index(0);
    stream->proto_stream.set_media_type(proto::MAL_MEDIA_TYPE_VIDEO);
    stream->proto_stream.set_video_codec(proto::MAL_VIDEO_CODEC_VP8);
    malFormatContext_->addStream(stream);
    pktLoaders[0] = std::make_shared<MALFFPacketLoader>(malFormatContext_, 0);
    return ret;
}
int WEBPParser::_parseChildAtom(std::shared_ptr<MALAtom> parent, bool once) {
    auto datasource = parent->dataSource;
    while (!datasource->isEof()) {
        std::shared_ptr<MALAtom> atom = std::make_shared<MALAtom>();
        atom->pos = datasource->currentBytesPosition();
        atom->name = rbytes_s(4);
        atom->size = rbytes_i_little(4) + 8;
        atom->size += atom->size & 1; //注意，必须是偶数
        if (atom->size == 0) {
            return 0;
        }
        atom->headerSize = 8;
        datasource->seekBytes(atom->pos, SEEK_SET);
        atom->dataSource = datasource->readBytesStream(atom->size);
        parent->childBoxs.push_back(atom);
        for (auto &parse : _parseTableEntry) {
            if (contains(splitToSet(std::get<0>(parse), "|"), atom->name)) {
                atom->dataSource->skipBytes(atom->headerSize); // 跳过头部
                std::get<1>(parse)(atom);
                break;
            }
        }
        if (once) break;
    }
    return 0;
}
void WEBPParser::registerParserTableEntry_() {
    _parseTableEntry.push_back(
                               std::make_tuple("RIFF", [=](std::shared_ptr<MALAtom> atom) {
                                   atom->dataSource->skipBytes(-4);
                                   atom->writeField("File Size", 4 * 8,0);
                                   atom->writeField<std::string>("Magic", 4 * 8);
                                   this->_parseChildAtom(atom);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("ANMF", [=](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("Frame X",3*8,0);
                                   atom->writeField("Frame Y",3*8,0);
                                   atom->writeField("Frame Width Minus One",3*8,0);
                                   atom->writeField("Frame Height Minus One",3*8,0);
                                   atom->writeField("Frame Duration",3*8,0);
                                   atom->writeField("Reserved",6,0);
                                   atom->writeField("Blending method",1,0);
                                   atom->writeField("Disposal method",1,0);
                                   this->_parseChildAtom(atom);
             
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("VP8X", [=](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("Reserved",2,0);
                                   atom->writeField("ICC profile",1,0);
                                   atom->writeField("Alpha",1,0);
                                   atom->writeField("Exif metadata",1,0);
                                   atom->writeField("XMP metadata",1,0);
                                   atom->writeField("Animation",1,0);
                                   atom->writeField("Reserved",1,0);
                                   atom->writeField("Reserved",24,0);
                                   atom->writeField("Canvas Width Minus One",24,0);
                                   atom->writeField("Canvas Height Minus One",24,0);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("VP8L", [=](std::shared_ptr<MALAtom> atom) {
                                   atom->writeHexField("Sign",8);
                                   atom->writeField("Image_width Minus One",14,0);
                                   atom->writeField("Image_height Minus One",14,0);
                                   atom->writeField("Alpha_is_used",1,0);
                                   atom->writeField("Version_number",3,0);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("ALPH", [=](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("Rsv",2,0);
                                   atom->writeField("P",2,0);
                                   atom->writeField("F",2,0);
                                   atom->writeField("C",2,0);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("ANIM", [=](std::shared_ptr<MALAtom> atom) {
                                   atom->writeHexField("Background Color",4 * 8,0);
                                   atom->writeField("Loop Count",2 * 8,0);
                               }));
}
