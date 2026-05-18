//
//  mal_webp_parser.cpp
//  Demo
//
//  Created by wangyaqiang on 2024/11/11.
//

#include "mal_jpg_parser.hpp"
#include "../../utils/mal_string.hpp"
#include "loader/mal_ff_packet_loader.hpp"
using namespace mal;
JPGParser::JPGParser(const std::shared_ptr<IDataSource>& datasource):IParser(datasource) {
    
}
JPGParser::JPGParser(const std::string& path, Type type):IParser(path, type) {
    markes.push_back({0xC0,0xC3,2,"SOF"});
    markes.push_back({0xC5,0xC7,2,"SOF"});
    markes.push_back({0xC8,0xC8,2,"JPG"});
    markes.push_back({0xC9,0xCF,2,"SOF"});
    
    markes.push_back({0xC4,0xC4,2,"DHT"});
    markes.push_back({0xCC,0xCC,2,"DAC"});

    markes.push_back({0xD0,0xD7,2,"RST"});
    
    markes.push_back({0xD8,0xD8,0,"SOI"});
    markes.push_back({0xD9,0xD9,0,"EOI"});
    markes.push_back({0xDA,0xDA,2,"SOS"});
    markes.push_back({0xDB,0xDB,2,"DQT"});
    markes.push_back({0xDC,0xDC,2,"DNL"});
    markes.push_back({0xDD,0xDD,2,"DRI"});
    markes.push_back({0xDE,0xDE,2,"DHP"});
    markes.push_back({0xDF,0xDF,2,"EXP"});
    
    markes.push_back({0xE0,0xEF,2,"APP"});
    markes.push_back({0xF0,0xFD,2,"JPG"});
    markes.push_back({0xFE,0xFE,2,"COM"});
    
    markes.push_back({0x01,0x01,-1,"TEM"});
    markes.push_back({0x02,0xBF,-1,"RES"});
}
int JPGParser::startParse() {
    int ret = 0;
    ret = _parseAtom();
    return 0;
}

bool JPGParser::supportFormat() {
    bool ret = false;
    if (_datasource->totalSize() < 8) return false;
    if (_datasource->readBytesInt64(2) == 0xffd8) {
        if (_datasource->readBytesInt64(1) == 0xff) {
            ret = true;
        }
    }
    _datasource->seekBytes(0, SEEK_SET);
    return ret;
}
int JPGParser::_parseAtom() {
    int ret = 0;
    malFormatContext_->root_atom = std::make_shared<MALAtom>();
    malFormatContext_->root_atom->name = "root";
    malFormatContext_->root_atom->dataSource = _datasource;
    malFormatContext_->root_atom->size = _datasource->totalSize();
    malFormatContext_->root_atom->pos = 0;
    malFormatContext_->proto_context.set_name("JPG");
    _parseChildAtom(malFormatContext_->root_atom);
    auto stream = std::make_shared<MALStream>();
    stream->proto_stream.set_index(0);
    stream->proto_stream.set_media_type(proto::MAL_MEDIA_TYPE_VIDEO);
    stream->proto_stream.set_video_codec(proto::MAL_VIDEO_CODEC_JPG);
    malFormatContext_->addStream(stream);
    pktLoaders[0] = std::make_shared<MALFFPacketLoader>(malFormatContext_, 0);
    return ret;
}
int JPGParser::_parseChildAtom(std::shared_ptr<MALAtom> parent, bool once) {
    auto datasource = parent->dataSource;
    while (!datasource->isEof()) {
        std::shared_ptr<MALAtom> atom = std::make_shared<MALAtom>();
        int64_t cur = datasource->currentBytesPosition();
        atom->pos = cur + parent->pos;
        parseMarker(parent, atom);
        datasource->seekBytes(cur, SEEK_SET);
        atom->dataSource = datasource->readBytesStream(atom->size);
        parent->childBoxs.push_back(atom);
        preAtom = atom;
        if (atom->name == "SOS") {
            std::shared_ptr<MALAtom> img = std::make_shared<MALAtom>();
            int64_t cur = datasource->currentBytesPosition();
            img->pos = cur + parent->pos;
            img->name = "IMG";
            parseMarker(parent, img);
            datasource->seekBytes(cur, SEEK_SET);
            img->dataSource = datasource->readBytesStream(img->size);
            parent->childBoxs.push_back(img);
            preAtom = img;
        }
    }
    return 0;
}

void JPGParser::parseMarker(std::shared_ptr<MALAtom> parent, std::shared_ptr<MALAtom> atom) {
    auto datasource = parent->dataSource;
    int64_t first = datasource->readBytesInt64(1);
    int64_t marker = datasource->readBytesInt64(1);
    if (first != 0xff) {
        marker = -1;
    }
    std::string name = "UNKNOWN";
    bool find = false;
    for (auto it : markes) {
        int start = std::get<0>(it);
        int end = std::get<1>(it);
        int len = std::get<2>(it);
        std::string name = std::get<3>(it);
        if (marker >= start && marker <= end) {
            find = true;
            if (start < end) {
                name = fmt::format("{}{}",name, marker - start);
            }
            atom->name = name;
            if (len == 0) {
                atom->size = 2;
            } else if (len > 0) {
                atom->size = datasource->readBytesInt64(len) + 2;
            } else {
                int64_t next = nextMarker(parent);
                atom->size = next + 2;
            }
            if (atom->name == "SOF0") {
                
            }
            break;
        }
    }
    if (atom->name.empty()) {
        atom->name = name;
    }
    if (!find) {
        int64_t next = nextMarker(parent);
        atom->size = next + 2;
    }
    
}
int64_t JPGParser::nextMarker(std::shared_ptr<MALAtom> parent) {
    auto datasource = parent->dataSource;
    int64_t ret = datasource->lastBytes();
    int64_t cur = datasource->currentBytesPosition();
    while (!datasource->isEof()) {
        bool find = false;
        int64_t marker_first = datasource->readBytesInt64(1);
        if (marker_first == 0xff && !datasource->isEof()) {
            int64_t marker = datasource->readBytesInt64(1);
            for (auto it : markes) {
                int start = std::get<0>(it);
                int end = std::get<1>(it);
                if (marker >= start && marker <= end) {
                    ret = datasource->currentBytesPosition() - 2 - cur;
                    find = true;
                    break;
                }
            }
        }
        if (find) break;
    }
    datasource->seekBytes(cur,SEEK_SET);
    return ret;
}



