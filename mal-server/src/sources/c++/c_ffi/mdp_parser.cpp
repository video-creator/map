#include "mdp_parser.h"
#include "../parser/mal_i_parser.h"
#include "../parser/mal_mov_parser.h"
#include "../parser/mal_webp_parser.hpp"
#include "../parser/mal_flv_parser.hpp"
#include "../parser/mal_matroska_parser.hpp"
#include "../parser/mal_png_parser.hpp"
#include "../parser/mal_dump.hpp"
#include <vector>
#include <fstream>
#ifdef __cplusplus
extern "C" {
#endif
using namespace mal;
void* mdp_create_parser(char *path) {
    std::vector<IParser *> parsers = {
        new MP4Parser(path,Type::local),
        new WEBPParser(path,Type::local),
        new FLVPParser(path,Type::local),
        new MALMatroskaParser(path,Type::local),
        new MALPNGParser(path,Type::local)
    };
    for (auto& el : parsers) {
        if (el->supportFormat()) {
            return el;
        }
    }
    return nullptr;
}
void *mdp_dump_box(void *parser) {
    IParser *_parser = (IParser *)parser;
    if (!_parser) return nullptr;
    _parser->startParse();
    _parser->dumpFormats(1);
    _parser->dumpVideoConfig();
//    auto packets = _parser->loadPackets(5000);
//    for (int i = 0; i < packets.size(); i++) {
//        std::string content = dumpPacket(packets[i]);
//        std::string filename = "/Users/Shared/output_pkt_" + std::to_string(i) + ".json";
//        // 创建一个输出文件流
//        std::ofstream outputFile(filename);
//        
//        // 检查文件是否成功打开
//        if (!outputFile) {
//            std::cerr << "无法打开文件: " << filename << std::endl;
//        }
//        // 将 JSON 字符串写入文件
//        outputFile << content;
//        
//        // 关闭文件
//        outputFile.close();
//    }
    //    if (packets.size() > 0) {
    //        std::string content = dumpPacket(packets[1]);
    //        std::cout << content << std::endl;
    //    }
//    for (auto& pkt : packets) {
//        std::cout << pkt->dumpSampleJson() << std::endl;
//    }
    _parser->dumpShallowCheck();

    return NULL;
}

#ifdef __cplusplus
}
#endif
