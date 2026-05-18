//
//  mal_matroska_parser.cpp
//  Demo
//
//  Created by wangyaqiang on 2025/9/18.
//

#include "mal_matroska_parser.hpp"
#include "../deps/spdlog/fmt/fmt.h"
//解析规则：https://www.matroska.org/technical/diagram.html
MALMatroskaParser::MALMatroskaParser(const std::string& path, Type type):IParser(path, type) {
    
}
typedef enum ElementType {
    ElementType_None,
    ElementType_MasterElement,
    ElementType_SignedInteger,
    ElementType_UnsignedInteger,
    ElementType_Float,
    ElementType_String,
    ElementType_UTF8,
    ElementType_Date,
    ElementType_Binary,
}ElementType;

static std::unordered_map<uint64_t, std::tuple<ElementType,std::string>> elements = {
    {0x1A45DFA3,{ElementType_MasterElement,"EBML"}},
    {0x4286,{ElementType_UnsignedInteger,"EBMLVersion"}},
    {0x42F7,{ElementType_UnsignedInteger,"EBMLReadVersion"}},
    {0x42F2,{ElementType_UnsignedInteger,"EBMLMaxIDLength"}},
    {0x42F3,{ElementType_UnsignedInteger,"EBMLMaxSizeLength"}},
    {0x4282,{ElementType_String,"DocType"}},
    {0x4287,{ElementType_UnsignedInteger,"DocTypeVersion"}},
    {0x4285,{ElementType_UnsignedInteger,"DocTypeReadVersion"}},
    {0x4281,{ElementType_MasterElement,"DocTypeExtension"}},
    {0x4283,{ElementType_String,"DocTypeExtensionName"}},
    {0x4284,{ElementType_UnsignedInteger,"DocTypeExtensionVersion"}},
    {0xBF,{ElementType_Binary,"CRC-32"}},
    {0xEC,{ElementType_Binary,"Void"}},
    {0x18538067,{ElementType_MasterElement,"Segment"}},
    {0x114D9B74,{ElementType_MasterElement,"SeekHead"}},
    {0x4DBB,{ElementType_MasterElement,"Seek"}},
    {0x53AB,{ElementType_Binary,"SeekID"}},
    {0x53AC,{ElementType_UnsignedInteger,"SeekPosition"}},
    
    {0x1549A966,{ElementType_MasterElement,"Info"}},
    {0x73A4,{ElementType_Binary,"SegmentUUID"}},
    {0x7384,{ElementType_UTF8,"SegmentFilename"}},
    {0x3CB923,{ElementType_Binary,"PrevUUID"}},
    {0x3C83AB,{ElementType_UTF8,"PrevFilename"}},
    {0x3EB923,{ElementType_Binary,"NextUUID"}},
    {0x3E83BB,{ElementType_UTF8,"NextFilename"}},
    {0x4444,{ElementType_Binary,"SegmentFamily"}},
    {0x6924,{ElementType_MasterElement,"ChapterTranslate"}},
    {0x69A5,{ElementType_Binary,"ChapterTranslateID"}},
    {0x69BF,{ElementType_UnsignedInteger,"ChapterTranslateCodec"}},
    {0x69FC,{ElementType_UnsignedInteger,"ChapterTranslateEditionUID"}},
    {0x2AD7B1,{ElementType_UnsignedInteger,"TimestampScale"}},
    {0x4489,{ElementType_Float,"Duration"}},
    {0x4461,{ElementType_Date,"DateUTC"}},
    {0x7BA9,{ElementType_String,"Title"}},
    {0x4D80,{ElementType_UTF8,"MuxingApp"}},
    {0x5741,{ElementType_UTF8,"WritingApp"}},
    
    {0x1654AE6B,{ElementType_MasterElement,"Tracks"}},
    {0xAE,{ElementType_MasterElement,"TrackEntry"}},
    {0xD7,{ElementType_UnsignedInteger,"TrackNumber"}},
    {0x73C5,{ElementType_UnsignedInteger,"TrackUID"}},
    {0x83,{ElementType_UnsignedInteger,"TrackType"}},
    {0xB9,{ElementType_UnsignedInteger,"FlagEnabled"}},
    {0x88,{ElementType_UnsignedInteger,"FlagDefault"}},
    {0x55AA,{ElementType_UnsignedInteger,"FlagForced"}},
    {0x55AB,{ElementType_UnsignedInteger,"FlagHearingImpaired"}},
    {0x55AC,{ElementType_UnsignedInteger,"FlagVisualImpaired"}},
    {0x55AD,{ElementType_UnsignedInteger,"FlagTextDescriptions"}},
    {0x55AE,{ElementType_UnsignedInteger,"FlagOriginal"}},
    {0x55AF,{ElementType_UnsignedInteger,"FlagCommentary"}},
    {0x9C,{ElementType_UnsignedInteger,"FlagLacing"}},
    {0x23E383,{ElementType_UnsignedInteger,"DefaultDuration"}},
    {0x234E7A,{ElementType_UnsignedInteger,"DefaultDecodedFieldDuration"}},
    {0x23314F,{ElementType_Float,"TrackTimestampScale"}},
    {0x55EE,{ElementType_UnsignedInteger,"MaxBlockAdditionID"}},
    {0x41E4,{ElementType_MasterElement,"BlockAdditionMapping"}},
    {0x41F0,{ElementType_UnsignedInteger,"BlockAddIDValue"}},
    {0x41A4,{ElementType_String,"BlockAddIDName"}},
    {0x41E7,{ElementType_UnsignedInteger,"BlockAddIDType"}},
    {0x41ED,{ElementType_Binary,"BlockAddIDExtraData"}},
    {0x536E,{ElementType_UTF8,"Name"}},
    {0x22B59C,{ElementType_String,"Language"}},
    {0x22B59D,{ElementType_String,"LanguageBCP47"}},
    {0x86,{ElementType_String,"CodecID"}},
    {0x63A2,{ElementType_Binary,"CodecPrivate"}},
    {0x258688,{ElementType_UTF8,"CodecName"}},
    {0x7446,{ElementType_UnsignedInteger,"AttachmentLink"}},
    {0x56AA,{ElementType_UnsignedInteger,"CodecDelay"}},
    {0x56BB,{ElementType_UnsignedInteger,"SeekPreRoll"}},
    {0x6624,{ElementType_MasterElement,"TrackTranslate"}},
    {0x66A5,{ElementType_Binary,"TrackTranslateTrackID"}},
    {0x66BF,{ElementType_UnsignedInteger,"TrackTranslateCodec"}},
    {0x66FC,{ElementType_UnsignedInteger,"TrackTranslateEditionUID"}},
    {0xE0,{ElementType_MasterElement,"Video"}},
    {0x9A,{ElementType_UnsignedInteger,"FlagInterlaced"}},
    {0x9D,{ElementType_UnsignedInteger,"FieldOrder"}},
    {0x53B8,{ElementType_UnsignedInteger,"StereoMode"}},
    {0x53C0,{ElementType_UnsignedInteger,"AlphaMode"}},
    {0x53B9,{ElementType_UnsignedInteger,"OldStereoMode"}},
    {0xB0,{ElementType_UnsignedInteger,"PixelWidth"}},
    {0xBA,{ElementType_UnsignedInteger,"PixelHeight"}},
    {0x54AA,{ElementType_UnsignedInteger,"PixelCropBottom"}},
    {0x54BB,{ElementType_UnsignedInteger,"PixelCropTop"}},
    {0x54CC,{ElementType_UnsignedInteger,"PixelCropLeft"}},
    {0x54DD,{ElementType_UnsignedInteger,"PixelCropRight"}},
    {0x54B0,{ElementType_UnsignedInteger,"DisplayWidth"}},
    {0x54BA,{ElementType_UnsignedInteger,"DisplayHeight"}},
    {0x54B2,{ElementType_UnsignedInteger,"DisplayUnit"}},
    {0x2EB524,{ElementType_Binary,"UncompressedFourCC"}},
    {0x55B0,{ElementType_MasterElement,"Colour"}},
    {0x55B1,{ElementType_UnsignedInteger,"MatrixCoefficients"}},
    {0x55B2,{ElementType_UnsignedInteger,"BitsPerChannel"}},
    {0x55B3,{ElementType_UnsignedInteger,"ChromaSubsamplingHorz"}},
    {0x55B4,{ElementType_UnsignedInteger,"ChromaSubsamplingVert"}},
    {0x55B5,{ElementType_UnsignedInteger,"CbSubsamplingHorz"}},
    {0x55B6,{ElementType_UnsignedInteger,"CbSubsamplingVert"}},
    {0x55B7,{ElementType_UnsignedInteger,"ChromaSitingHorz"}},
    {0x55B8,{ElementType_UnsignedInteger,"ChromaSitingVert"}},
    {0x55B9,{ElementType_UnsignedInteger,"Range"}},
    {0x55BA,{ElementType_UnsignedInteger,"TransferCharacteristics"}},
    {0x55BB,{ElementType_UnsignedInteger,"Primaries"}},
    {0x55BC,{ElementType_UnsignedInteger,"MaxCLL"}},
    {0x55BD,{ElementType_UnsignedInteger,"MaxFALL"}},
    {0x55D0,{ElementType_MasterElement,"MasteringMetadata"}},
    {0x55D1,{ElementType_Float,"PrimaryRChromaticityX"}},
    {0x55D2,{ElementType_Float,"PrimaryRChromaticityY"}},
    {0x55D3,{ElementType_Float,"PrimaryGChromaticityX"}},
    {0x55D4,{ElementType_Float,"PrimaryGChromaticityY"}},
    {0x55D5,{ElementType_Float,"PrimaryBChromaticityX"}},
    {0x55D6,{ElementType_Float,"PrimaryBChromaticityY"}},
    {0x55D7,{ElementType_Float,"WhitePointChromaticityX"}},
    {0x55D8,{ElementType_Float,"WhitePointChromaticityY"}},
    {0x55D9,{ElementType_Float,"LuminanceMax"}},
    {0x55DA,{ElementType_Float,"LuminanceMin"}},
    {0x7670,{ElementType_MasterElement,"Projection"}},
    {0x7671,{ElementType_UnsignedInteger,"ProjectionType"}},
    {0x7672,{ElementType_Binary,"ProjectionPrivate"}},
    {0x7673,{ElementType_Float,"ProjectionPoseYaw"}},
    {0x7674,{ElementType_Float,"ProjectionPosePitch"}},
    {0x7675,{ElementType_Float,"ProjectionPoseRoll"}},
    {0xE1,{ElementType_MasterElement,"Audio"}},
    {0xB5,{ElementType_Float,"SamplingFrequency"}},
    {0x78B5,{ElementType_Float,"OutputSamplingFrequency"}},
    {0x9F,{ElementType_UnsignedInteger,"Channels"}},
    {0x6264,{ElementType_UnsignedInteger,"BitDepth"}},
    {0xE2,{ElementType_MasterElement,"TrackOperation"}},
    {0xE3,{ElementType_MasterElement,"TrackCombinePlanes"}},
    {0xE4,{ElementType_MasterElement,"TrackPlane"}},
    {0xE5,{ElementType_UnsignedInteger,"TrackPlaneUID"}},
    {0xE6,{ElementType_UnsignedInteger,"TrackPlaneType"}},
    {0xE9,{ElementType_MasterElement,"TrackJoinBlocks"}},
    {0xED,{ElementType_UnsignedInteger,"TrackJoinUID"}},
    {0x6D80,{ElementType_MasterElement,"ContentEncodings"}},
    {0x6240,{ElementType_MasterElement,"ContentEncoding"}},
    {0x5031,{ElementType_UnsignedInteger,"ContentEncodingOrder"}},
    {0x5032,{ElementType_UnsignedInteger,"ContentEncodingScope"}},
    {0x5033,{ElementType_UnsignedInteger,"ContentEncodingType"}},
    {0x5034,{ElementType_MasterElement,"ContentCompression"}},
    {0x4254,{ElementType_UnsignedInteger,"ContentCompAlgo"}},
    {0x4255,{ElementType_Binary,"ContentCompSettings"}},
    {0x5035,{ElementType_MasterElement,"ContentEncryption"}},
    {0x47E1,{ElementType_UnsignedInteger,"ContentEncAlgo"}},
    {0x47E2,{ElementType_Binary,"ContentEncKeyID"}},
    {0x47E7,{ElementType_MasterElement,"ContentEncAESSettings"}},
    {0x47E8,{ElementType_UnsignedInteger,"AESSettingsCipherMode"}},
    
    
    {0x1043A770,{ElementType_MasterElement,"Chapters"}},
    {0x45B9,{ElementType_MasterElement,"EditionEntry"}},
    {0x45BC,{ElementType_UnsignedInteger,"EditionUID"}},
    {0x45DB,{ElementType_UnsignedInteger,"EditionFlagDefault"}},
    {0x45DD,{ElementType_UnsignedInteger,"EditionFlagOrdered"}},
    {0xB6,{ElementType_MasterElement,"+ChapterAtom"}},
    {0x73C4,{ElementType_UnsignedInteger,"ChapterUID"}},
    {0x5654,{ElementType_UTF8,"ChapterStringUID"}},
    {0x91,{ElementType_UnsignedInteger,"ChapterTimeStart"}},
    {0x92,{ElementType_UnsignedInteger,"ChapterTimeEnd"}},
    {0x98,{ElementType_UnsignedInteger,"ChapterFlagHidden"}},
    {0x6E67,{ElementType_Binary,"ChapterSegmentUUID"}},
    {0x6EBC,{ElementType_UnsignedInteger,"ChapterSegmentEditionUID"}},
    {0x63C3,{ElementType_UnsignedInteger,"ChapterPhysicalEquiv"}},
    {0x80,{ElementType_MasterElement,"ChapterDisplay"}},
    {0x85,{ElementType_UTF8,"ChapString"}},
    {0x437C,{ElementType_String,"ChapLanguage"}},
    {0x437D,{ElementType_String,"ChapLanguageBCP47"}},
    {0x437E,{ElementType_String,"ChapCountry"}},
    {0x6944,{ElementType_MasterElement,"ChapProcess"}},
    {0x6955,{ElementType_UnsignedInteger,"ChapProcessCodecID"}},
    {0x450D,{ElementType_Binary,"ChapProcessPrivate"}},
    {0x6911,{ElementType_MasterElement,"ChapProcessCommand"}},
    {0x6922,{ElementType_UnsignedInteger,"ChapProcessTime"}},
    {0x6933,{ElementType_Binary,"ChapProcessData"}},
    {0x45BD,{ElementType_UnsignedInteger,"EditionFlagHidden"}},
    {0x4598,{ElementType_UnsignedInteger,"ChapterFlagEnabled"}},
    
    
    {0x1254C367,{ElementType_MasterElement,"Tags"}},
    {0x7373,{ElementType_MasterElement,"Tag"}},
    {0x63C0,{ElementType_MasterElement,"Targets"}},
    {0x68CA,{ElementType_UnsignedInteger,"TargetTypeValue"}},
    {0x63CA,{ElementType_String,"TargetType"}},
    {0x63C5,{ElementType_UnsignedInteger,"TagTrackUID"}},
    {0x63C9,{ElementType_UnsignedInteger,"TagEditionUID"}},
    {0x63C4,{ElementType_UnsignedInteger,"TagChapterUID"}},
    {0x63C6,{ElementType_UnsignedInteger,"TagAttachmentUID"}},
    {0x67C8,{ElementType_MasterElement,"+SimpleTag"}},
    {0x45A3,{ElementType_UTF8,"TagName"}},
    {0x447A,{ElementType_String,"TagLanguage"}},
    {0x447B,{ElementType_String,"TagLanguageBCP47"}},
    {0x4484,{ElementType_UnsignedInteger,"TagDefault"}},
    {0x4487,{ElementType_UTF8,"TagString"}},
    {0x4485,{ElementType_Binary,"TagBinary"}},
    
    {0x1F43B675,{ElementType_MasterElement,"Cluster"}},
    {0xE7,{ElementType_UnsignedInteger,"Timestamp"}},
    {0xA7,{ElementType_UnsignedInteger,"Position"}},
    {0xAB,{ElementType_UnsignedInteger,"PrevSize"}},
    
    {0x1C53BB6B,{ElementType_MasterElement,"Cues"}},
    {0xBB,{ElementType_MasterElement,"CuePoint"}},
    {0xB3,{ElementType_UnsignedInteger,"CueTime"}},
    {0xB7,{ElementType_MasterElement,"CueTrackPositions"}},
    {0xF7,{ElementType_UnsignedInteger,"CueTrack"}},
    {0xF1,{ElementType_UnsignedInteger,"CueClusterPosition"}},
    {0xF0,{ElementType_UnsignedInteger,"CueRelativePosition"}},
    {0xB2,{ElementType_UnsignedInteger,"CueDuration"}},
    {0x5378,{ElementType_UnsignedInteger,"CueBlockNumber"}},
    {0xEA,{ElementType_UnsignedInteger,"CueCodecState"}},
    {0xDB,{ElementType_MasterElement,"CueReference"}},
    {0x96,{ElementType_UnsignedInteger,"CueRefTime"}},
    
    
    
    {0xA0,{ElementType_MasterElement,"BlockGroup"}},
    {0xA1,{ElementType_Binary,"Block"}},
    
    {0x75A1,{ElementType_MasterElement,"BlockAdditions"}},
    {0xA6,{ElementType_MasterElement,"BlockMore"}},
    {0xA5,{ElementType_Binary,"BlockAdditional"}},
    {0xEE,{ElementType_UnsignedInteger,"BlockAddID"}},
    {0x9B,{ElementType_UnsignedInteger,"BlockDuration"}},
    
    {0xA3,{ElementType_Binary,"SimpleBlock"}},
    
};
int MALMatroskaParser::startParse() {
    int ret = 0;
    ret = _parseAtom();
    for (auto& stream : malFormatContext_->streams) {
        int index = stream->proto_stream.index();
        pktLoaders[index] = std::make_shared<MALMatroskaLoader>(malFormatContext_,index);
    }
    return ret;
}
int MALMatroskaParser::_parseAtom() {
    int ret = 0;
    malFormatContext_->root_atom = std::make_shared<MALAtom>();
    malFormatContext_->root_atom->name = "root";
    malFormatContext_->root_atom->dataSource = _datasource;
    malFormatContext_->root_atom->size = _datasource->totalSize();
    malFormatContext_->root_atom->pos = 0;
    _parseChildAtom(malFormatContext_->root_atom);
    return ret;
}
void MALMatroskaParser::_parseUnsignedIntegerElement(int64_t elementId, uint64_t elementSize, std::shared_ptr<MALAtom> atom) {
    uint64_t value = atom->dataSource->readBytesInt64(elementSize);
    std::string extraVal = "";
    switch (elementId) {
        case 0x2AD7B1: //TimestampScale
            context.info.timestampScale = value;
            break;
        case 0x53AC: //seekposition
            extraVal = "position是相对于semgment data开始";
            break;
        case 0x23e383: // tracks/trackentry/defaultduration
            extraVal = "表示默认单帧显示时长，单位ns";
            break;
        case 0xD7:
            if (currentStream_) {
                streamsMap[value] = currentStream_;
            }
            break;
        case 0xB0: //video width
            if (currentStream_) {
                currentStream_->proto_stream.mutable_video_stream()->set_width(value);
            }
            break;
        case 0xBA: //video height
            if (currentStream_) {
                currentStream_->proto_stream.mutable_video_stream()->set_height(value);
            }
            break;
        case 0xe7: //cluster timesamp
            if (currentCluster_) {
                currentCluster_->timestamp = value;
            }
            break;
        case 0x9b: //block duration
            if (currentBlock_) {
                currentBlock_->duration = value;
            }
            break;
        default:
            
            break;
    }
    atom->writeValueField<uint64_t>("value", value, extraVal);
}
void MALMatroskaParser::_parseStringElement(int64_t elementId,  int64_t elementSize, std::shared_ptr<MALAtom> atom) {
    auto val = atom->writeField<std::string>("value", elementSize * 8);
    if (elementId == 0x86 && currentStream_) { //codecid
        std::string videoPrefix = "V_";
        std::string audioPrefix = "A_";
        std::string subtitlePrefix1 = "S_";
        std::string subtitlePrefix2 = "D_";
        if (!val.compare(0, videoPrefix.size(), videoPrefix)) {
            currentStream_->proto_stream.set_media_type(::mal::proto::MAL_MEDIA_TYPE_VIDEO);
            if (val.find("AVC") != std::string::npos) {
                currentStream_->proto_stream.set_video_codec(mal::proto::MAL_VIDEO_CODEC_H264);
            } else if (val.find("HEVC") != std::string::npos) {
                currentStream_->proto_stream.set_video_codec(mal::proto::MAL_VIDEO_CODEC_H265);
            } else if (val.find("VP9") != std::string::npos) {
                currentStream_->proto_stream.set_video_codec(mal::proto::MAL_VIDEO_CODEC_VP9);
            }
        } else if (!val.compare(0, audioPrefix.size(), audioPrefix)) {
            currentStream_->proto_stream.set_media_type(::mal::proto::MAL_MEDIA_TYPE_AUDIO);
            if (val.find("EAC3") != std::string::npos) {
                currentStream_->proto_stream.set_audio_codec(mal::proto::MAL_AUDIO_CODEC_AC3);
            }
        } else if (!val.compare(0, subtitlePrefix1.size(), subtitlePrefix1) || val.compare(0, subtitlePrefix2.size(), subtitlePrefix2)) {
            currentStream_->proto_stream.set_media_type(::mal::proto::MAL_MEDIA_TYPE_Subtitle);
            
        }
    }
}
void MALMatroskaParser::_parseFloatIntegerElement(int64_t elementId, double value, std::shared_ptr<MALAtom> atom) {
    switch (elementId) {
        case 0x4489 : //duration
            {
                context.info.duration = value;
                double durationS = value * context.info.timestampScale / 1000000000.0;
                malFormatContext_->proto_context.set_duration(durationS);
            
            }
            break;
            
        default:
            break;
    }
}
void MALMatroskaParser::_parseMasterElement(int64_t elementId, int64_t elementSize, std::shared_ptr<MALAtom> atom) {
    if (elementId == 0xAE) { //trackentry
        currentStream_ = std::make_shared<MALMatroskaStream>();
        malFormatContext_->addStream(currentStream_);
    } else if (elementId == 0x1f43b675) { //cluster
        currentCluster_ = std::make_shared<MALMatroskaCluster>();
    }
    _parseChildAtom(atom);
}
void MALMatroskaParser::_parseBinaryElement(int64_t elementId, int64_t elementSize, std::shared_ptr<MALAtom> atom) {
    if (elementId == 0xA3) { //simpleblock
        int trackNumberLen = _parseVariableInteger(atom->dataSource);
        auto trackNumber = atom->writeField<uint64_t>("Track Number", trackNumberLen * 8 - trackNumberLen);
        auto timestamp = atom->writeField<uint64_t>("Timestamp", 2 * 8);
        auto key = atom->writeField<uint64_t>("KEY", 1);
        atom->writeField<uint64_t>("Rsvrd", 3);
        atom->writeField<uint64_t>("INV", 1);
        atom->writeField<uint64_t>("LACING", 2);
        auto dis = atom->writeField<uint64_t>("DIS", 1);
        if (streamsMap.find(trackNumber) != streamsMap.end()) {
            auto stream = streamsMap[trackNumber];
            auto block = std::make_shared<MALMatroskaBlock>();
            block->blockType = MALMatroskaBlockType_SampleBlock;
            block->trackNumber = trackNumber;
            block->timestamp = timestamp;
            block->key = key;
            block->dis = dis;
            block->pos = atom->pos + atom->dataSource->currentBytesPosition();
            block->size = atom->dataSource->lastBytes();
            block->parentCluster = currentCluster_;
            currentBlock_ = block;
            uint64_t maxSize = std::max((uint64_t)currentStream_->proto_stream.max_sample_size(), currentBlock_->size);
            stream->proto_stream.set_max_sample_size(maxSize);
            stream->blocks.push_back(currentBlock_);
        }
        
    } else if (elementId == 0x53ab) { //seekid
        uint64_t val = atom->dataSource->readBytesInt64(elementSize);
        std::string extraVal = "";
        if (elements.find(val) != elements.end()) {
            auto element = *elements.find(val);
            extraVal = std::get<1>(element.second);
        }
        atom->writeHexDirectValField("value", val, extraVal);
    } else if (elementId == 0x63a2) { //codecprivate
        if (currentStream_ && currentStream_->proto_stream.has_video_stream()) {
            auto datasource = atom->dataSource->readBytesStream(elementSize,true);
            if (currentStream_->video_config_future_.valid()) {
                mdp_video_header *header = currentStream_->video_config_future_.get();
                if (header) {
                    currentStream_->video_configs_.push_back(header);
                }
            }
            if (currentStream_->proto_stream.video_codec() == mal::proto::MAL_VIDEO_CODEC_H264) {
                auto avcc = std::make_shared<MALAVCC>();
                currentStream_->videoConfig.push_back(avcc);
            } else if (currentStream_->proto_stream.video_codec() == mal::proto::MAL_VIDEO_CODEC_H265) {
                auto hvcc = std::make_shared<MALHVCC>();
                currentStream_->videoConfig.push_back(hvcc);
            } else {
//                std::abort();
            }
            currentStream_->video_config_future_ = std::async(std::launch::async, [=](){
                MALCodecParser codecParser(datasource,malFormatContext_, currentStream_, currentStream_->currentConfig());
                mdp_video_header *video_config_ =codecParser.parse();
                return video_config_;
            });
        }
        atom->writeHexField("value", elementSize  * 8);
    } else if (elementId == 0xa1) { //Block
        int trackNumberLen = _parseVariableInteger(atom->dataSource);
        auto trackNumber = atom->writeField<uint64_t>("Track Number", trackNumberLen * 8 - trackNumberLen);
        auto timestamp = atom->writeField<uint64_t>("Timestamp", 2 * 8);
        atom->writeField<uint64_t>("Rsvrd", 4);
        atom->writeField<uint64_t>("INV", 1);
        atom->writeField<uint64_t>("LACING", 2);
        atom->writeField<uint64_t>("UNU", 1);
        if (streamsMap.find(trackNumber) != streamsMap.end()) {
            currentBlock_ = std::make_shared<MALMatroskaBlock>();
            currentBlock_->blockType = MALMatroskaBlockType_Block;
            currentBlock_->trackNumber = trackNumber;
            currentBlock_->timestamp = timestamp;
            currentBlock_->pos = atom->pos + atom->dataSource->currentBytesPosition();
            currentBlock_->size = atom->dataSource->lastBytes();
            auto stream = streamsMap[trackNumber];
            uint64_t maxSize = std::max((uint64_t)currentStream_->proto_stream.max_sample_size(), currentBlock_->size);
            stream->proto_stream.set_max_sample_size(maxSize);
            stream->blocks.push_back(currentBlock_);
        }
        atom->writeHexField("value", atom->dataSource->lastBytes() * 8);
    } else {
        atom->writeHexField("value", elementSize  * 8);
    }
}
int MALMatroskaParser::_parseChildAtom(std::shared_ptr<MALAtom> parent, bool once) {
    auto datasource = parent->dataSource;
    while (!datasource->isEof()) {
        if (stop)break;
        std::shared_ptr<MALAtom> atom = std::make_shared<MALAtom>();
        atom->parent = std::weak_ptr<MALAtom>(parent);
        int64_t curPos = datasource->currentBytesPosition();
        atom->pos = curPos + parent->pos;
        int elementIDLen = _parseVariableInteger(datasource);
        uint64_t elementID = datasource->readBitsInt64(elementIDLen * 8 - elementIDLen);
        elementID = (1 << (elementIDLen * 8 - elementIDLen)) + elementID;
        bool isContainer = false;
        ElementType type = ElementType_None;
        if (elements.find(elementID) != elements.end()) {
            auto element = *elements.find(elementID);
            type = std::get<0>(element.second);
            auto name = std::get<1>(element.second);
            atom->name = name;
            if (type == ElementType_MasterElement) {
                isContainer = true;
            }
        } else {
            atom->name = fmt::format("0x{:X}",elementID);
        }
        std::cout << "name:" << atom->name << std::endl;
        int elementSizeLen = _parseVariableInteger(datasource);
        uint64_t elementSize = datasource->readBitsInt64(elementSizeLen * 8 - elementSizeLen);
        atom->size = datasource->currentBytesPosition() - curPos + elementSize;
        if (atom->size == 0) {
            return 0;
        }
        if (curPos + atom->size > datasource->totalSize()) {
            malFormatContext_->addShallowWarning(fmt::format("有超出文件大小的atom:{}",atom->name));
            atom->size = datasource->totalSize() - curPos;
        }
        int64_t cur = datasource->currentBytesPosition();
        datasource->seekBytes(curPos, SEEK_SET);
        atom->dataSource = datasource->readBytesStream(atom->size);
        parent->childBoxs.push_back(atom);
        atom->writeHexDirectValField(fmt::format("elementID({}bits)",elementIDLen * 8), elementID);
        if (isContainer) {
            atom->dataSource->skipBytes(cur-curPos);
            _parseMasterElement(elementID, elementSize, atom);
        } else {
            atom->dataSource->seekBytes(cur-curPos,SEEK_SET);
            if (type == ElementType_UnsignedInteger) {
                _parseUnsignedIntegerElement(elementID, elementSize, atom);
            } else if (type == ElementType_SignedInteger) {
                if (elementSize <= 4) {
                    atom->writeField<int32_t>("value",elementSize * 8);
                } else if (elementSize <= 8) {
                    atom->writeField<int64_t>("value",elementSize * 8);
                } else {
                    atom->writeHexField("value", elementSize * 8);
                }
            } else if (type == ElementType_String || type == ElementType_UTF8) {
                _parseStringElement(elementID, elementSize, atom);
            } else if (type == ElementType_Binary) {
                _parseBinaryElement(elementID,elementSize, atom);
            } else if (type == ElementType_Float) {
                auto val = atom->writeField<double>("value", elementSize * 8);
                _parseFloatIntegerElement(elementID, val, atom);
            }
        }
        if (once) break;
    }
    return 0;
}

bool MALMatroskaParser::supportFormat() {
    if (!_datasource || _datasource->totalSize() < 12) return false;
    if (_datasource->readBytesInt64(4,true) != 0x1A45DFA3) return false;
    malFormatContext_->proto_context.set_name("MKV/WEBM");
    return true;
}
int MALMatroskaParser::_parseVariableInteger(std::shared_ptr<IDataSource> datasource) {
    int len = 0;
    while (!datasource->isEof() && datasource->readBitsInt64(1) == 0) {
        len ++;
    }
    len ++; //1的那位
    return len;
}
