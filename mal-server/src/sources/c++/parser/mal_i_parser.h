#pragma once
#include "mal_idatasource.h"
#include "mal_atom.h"
#include "mal_codec_parser.h"
#include "../loader/mal_packet_loader.hpp"
#define rbits_i(bits) datasource->readBitsInt64(bits)
#define rbytes_i(bits) datasource->readBytesInt64(bits)
#define rbits_i_little(bits) datasource->readBitsInt64(bits,false,0)
#define rbytes_i_little(bits) datasource->readBytesInt64(bits,false,0)
#define rbytes_s(bits) datasource->readBytesString(bits)
namespace mal {
enum MALParseState {
    IDL, //初始化
    FORMAT_PARSERD, //startParse
    LOAD_PACKET, //loadPackets
};
typedef struct ParseTableEntry {
    std::string type;
    int (*parse)(void *opaque,std::shared_ptr<MALAtom>parent,std::shared_ptr<MALAtom> box);
} ParseTableEntry;

class IParser {
public:
    IParser(const std::shared_ptr<IDataSource>& datasource);
    IParser(const std::string& path, Type type);
    virtual ~IParser();
    virtual int startParse();
    virtual bool supportFormat();
    virtual std::string dumpFormats(int full = 0);
    virtual std::string dumpVideoConfig();
    virtual std::string dumpShallowCheck();
    virtual std::string dumpDeepCheck();
    virtual void close() {
        stop = true;
    }
    bool stop = false;
    bool requestRunning = false;
    MALParseState state = MALParseState::IDL;
    void convert2ProtoFormatContext(proto::MALFormatContext* proto_fmt_ctx) {
        if (malFormatContext_) {
            malFormatContext_->convert2ProtoFormatContext(proto_fmt_ctx);
        }
        
    }
    std::shared_ptr<MALFormatContext> malFormatContext() {
        return malFormatContext_;
    }
    std::unordered_map<int, std::shared_ptr<MALPacketLoader>> pktLoaders;
    std::shared_ptr<MALFormatContext> getFormatContext() {
        return malFormatContext_;
    }
protected:
    std::shared_ptr<IDataSource> _datasource;
    //        std::shared_ptr<MALPacketLoader> pktLoader_ = nullptr;
    
    std::shared_ptr<MALFormatContext> malFormatContext_ = nullptr;
};
}
