//
//  mal_matroska_parser.hpp
//  Demo
//
//  Created by wangyaqiang on 2025/9/18.
//

#ifndef mal_matroska_parser_hpp
#define mal_matroska_parser_hpp
#include "mal_i_parser.h"
#include "mal_matroska_packet_loader.hpp"
#include <stdio.h>
namespace mal {

class MALMatroskaInfo {
public:
    uint64_t timestampScale = 1000000;
    double duration;
};


class MALMatroskaParserContext {
public:
    MALMatroskaInfo info;
};
class MALMatroskaParser: public IParser {
public:
    MALMatroskaParser(const std::string& path, Type type);
    bool supportFormat() override;
    int startParse() override;
private:
    MALMatroskaParserContext context;
    std::shared_ptr<MALMatroskaStream> currentStream_ = nullptr;
    std::shared_ptr<MALMatroskaCluster> currentCluster_ = nullptr;
    std::shared_ptr<MALMatroskaBlock> currentBlock_ = nullptr;
    std::unordered_map<uint64_t, std::shared_ptr<MALMatroskaStream>> streamsMap;
    int _parseVariableInteger(std::shared_ptr<IDataSource> datasource); //返回VINT_DATA
    int _parseAtom();
    int _parseChildAtom(std::shared_ptr<MALAtom> parent, bool once = false);
    void _parseMasterElement(int64_t elementId, int64_t elementSize, std::shared_ptr<MALAtom> atom);
    void _parseUnsignedIntegerElement(int64_t elementId, uint64_t value, std::shared_ptr<MALAtom> atom);
    void _parseFloatIntegerElement(int64_t elementId, double value, std::shared_ptr<MALAtom> atom);
    void _parseBinaryElement(int64_t elementId,  int64_t elementSize, std::shared_ptr<MALAtom> atom);
    void _parseStringElement(int64_t elementId,  int64_t elementSize, std::shared_ptr<MALAtom> atom);
};
}
#endif /* mal_matroska_parser_hpp */
