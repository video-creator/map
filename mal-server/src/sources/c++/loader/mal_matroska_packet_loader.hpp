//
//  mal_matroska_packet_loader.hpp
//  Demo
//
//  Created by wangyaqiang on 2025/10/21.
//

#ifndef mal_matroska_packet_loader_hpp
#define mal_matroska_packet_loader_hpp

#include <stdio.h>
#include "mal_packet_loader.hpp"
namespace mal {

class MALMatroskaCluster {
public:
    uint64_t timestamp;
};
typedef enum MALMatroskaBlockType {
    MALMatroskaBlockType_Block,
    MALMatroskaBlockType_SampleBlock
}MALMatroskaBlockType;

class MALMatroskaBlock {
public:
    MALMatroskaBlockType blockType = MALMatroskaBlockType_SampleBlock;
    uint64_t trackNumber;
    uint64_t timestamp;
    uint64_t key;
    uint64_t dis;
    
    uint64_t duration; //for blockgrop，例如字幕流
    
    uint64_t pos;
    uint64_t size;
    
    std::shared_ptr<MALMatroskaCluster> parentCluster;
};
class MALMatroskaStream : public MALStream {
public:
    int trackNumber;
    int64_t defaultDuration;
    std::vector<std::shared_ptr<MALMatroskaBlock>> blocks;
};

class MALMatroskaLoader: public MALPacketLoader {
public:
    MALMatroskaLoader(std::shared_ptr<MALFormatContext> fmtCtx, int streamIndex);
    std::vector<std::shared_ptr<MALPacket>> loadPackets(int size) override;
private:
    int currentIndex_ = 0;
    
    std::tuple<int64_t,int> findSamplePos(int sampleIndex);
    std::shared_ptr<MALMatroskaStream> stream_ = nullptr;
};
};
#endif /* mal_matroska_packet_loader_hpp */
