#include "mal_mov_parser.h"
#include "../deps/spdlog/fmt/fmt.h"
#include "../../utils/mal_string.hpp"
#include "mal_codec_parser.h"
#include <fstream>
#include <unordered_set>
#include <vector>
#include <iostream>
extern "C" {
#include "../../utils/cJSON.h"
#include "../../dart/dart_init.h"
}
using namespace mal;
MP4Parser::MP4Parser(const std::shared_ptr<IDataSource> &datasource)
: IParser(datasource) {
    registerParserTableEntry_();
}
MP4Parser::MP4Parser(const std::string &path, Type type) : IParser(path, type) {
    registerParserTableEntry_();
}
int parse_esds_len(std::shared_ptr<IDataSource> &datasource, int maxlen = 4) {
    int count = maxlen;
    int len = 0;
    while (count--) {
        int c = datasource->readBytesInt64(1);
         len = (len << 7) | (c & 0x7f);
         if (!(c & 0x80))
             break;
    }
    return len;
}
void MP4Parser::registerParserTableEntry_() {
    _parseTableEntry.push_back(
                               std::make_tuple("ftyp", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField<std::string>("major_brand", 4 * 8);
                                   atom->writeField("minor_version", 4 * 8);
                                   int64_t compatible_brands_size =
                                   atom->proto_atom.size() - atom->dataSource->currentBytesPosition();
                                   std::string compatible_brands = atom->writeField<std::string>(
                                                                                                 "compatible_brands", compatible_brands_size * 8);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("mvhd", [this](std::shared_ptr<MALAtom> atom) {
                                   auto mvhd_ptr = std::dynamic_pointer_cast<MALMP4FormatPrivData>(malFormatContext_->priv);
                                   auto& mvhd = mvhd_ptr->mvhd;
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   int creation_time_size = 4;
                                   int modification_time_size = 4;
                                   int timescale_size = 4;
                                   int duration = 4;
                                   if (version == 1) {
                                       creation_time_size = 8;
                                       modification_time_size = 8;
                                       timescale_size = 4;
                                       duration = 8;
                                   }
                                   int filedSize = creation_time_size;
                                   atom->writeField("creation_time", filedSize * 8);
                                   filedSize = modification_time_size;
                                   atom->writeField("modification_time", filedSize * 8);
                                   
                                   filedSize = timescale_size;
                                   auto timescale = atom->writeField<uint64_t>("timescale", filedSize * 8);
                                   mvhd.set_timescale(timescale);
                                   filedSize = duration;
                                   auto d = atom->writeField<uint64_t>("duration", filedSize * 8);
                                   mvhd.set_duration(d);
                                   filedSize = 4;
                                   atom->writeField("rate", filedSize * 8);
                                   
                                   filedSize = 2;
                                   atom->writeField("volume", filedSize * 8);
                                   
                                   filedSize = 2;
                                   atom->writeField("reserved", filedSize * 8);
                                   
                                   filedSize = 8;
                                   atom->writeField("reserved", filedSize * 8);
                                   
                                   filedSize = 36;
                                   atom->writeHexField("matrix", filedSize * 8); // TODO
                                   
                                   filedSize = 24;
                                   atom->writeField("pre_defined", filedSize * 8);
                                   
                                   filedSize = 4;
                                   atom->writeField("next_track_ID", filedSize * 8);
                                   auto duratoin = std::round(mvhd.duration() * 1.0/timescale * 1000000)/1000000.0;
                                   malFormatContext_->proto_context.set_duration(duratoin);
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("tkhd", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   int creation_time_size = 4;
                                   int modification_time_size = 4;
                                   int track_ID_size = 4;
                                   int reserved1_size = 4;
                                   int duration_size = 4;
                                   if (version == 1) {
                                       creation_time_size = 8;
                                       modification_time_size = 8;
                                       track_ID_size = 4;
                                       reserved1_size = 4;
                                       duration_size = 8;
                                   }
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("creation_time", creation_time_size * 8),
//                                       MALAtomField("modification_time", modification_time_size * 8),
//                                       MALAtomField("track_ID", track_ID_size * 8,MDPFieldDisplayType_int64,1, [=,&version](fast_any::any val) {
//                                           currentStream_->tkhd.set_track_id(*(val.as<uint64_t>()));
//                                           return val;
//                                       }),
//                                       MALAtomField("reserved1", reserved1_size * 8),
//                                       MALAtomField("duration", duration_size * 8,MDPFieldDisplayType_int64,1, [=,&version](fast_any::any val) {
//                                           currentStream_->tkhd.set_duration(*(val.as<uint64_t>()));
//                                           return val;
//                                       }),
//                                       MALAtomField("reserved2", 8 * 8),
//                                       MALAtomField("layer", 2 * 8),
//                                       MALAtomField("alternate_group", 2 * 8),
//                                       MALAtomField("volume", 2 * 8),
//                                       MALAtomField("reserved3", 2 * 8),
//                                       MALAtomField("matrix", 36 * 8,
//                                                    MDPFieldDisplayType_hex),
//                                       MALAtomField("width", 4 * 8,
//                                                    MDPFieldDisplayType_fixed_16X16_float,1, [=,&version](fast_any::any val) {
//                                           currentStream_->tkhd.set_width(*(val.as<double>()));
//                                           return val;
//                                       }),
//                                       MALAtomField("height", 4 * 8,
//                                                    MDPFieldDisplayType_fixed_16X16_float,1, [=,&version](fast_any::any val) {
//                                           currentStream_->tkhd.set_height(*(val.as<double>()));
//                                           return val;
//                                       })};
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   atom->writeField<int64_t>("creation_time", creation_time_size * 8);
                                   atom->writeField<int64_t>("modification_time", modification_time_size * 8);
                                   auto track_id =  atom->writeField<int64_t>("track_ID", track_ID_size * 8);
                                   currentStream_->tkhd.set_track_id(track_id);
                                   atom->writeField<int64_t>("reserved1", reserved1_size * 8);
                                   auto duration = atom->writeField<int64_t>("duration", duration_size * 8);
                                   currentStream_->tkhd.set_duration(duration);
                                   atom->writeField<int64_t>("reserved2", 8 * 8);
                                   atom->writeField<int64_t>("layer", 2 * 8);
                                   atom->writeField<int64_t>("alternate_group", 2 * 8);
                                   atom->writeField<int64_t>("volume", 2 * 8);
                                   atom->writeField<int64_t>("reserved3", 2 * 8);
                                   atom->writeHexField("matrix", 36 * 8);
                                   auto width = atom->writeFix16X16PointField("width", 4 * 8);
                                   currentStream_->tkhd.set_width(width);
                                   currentStream_->proto_stream.mutable_video_stream()->set_width(width);
                                   auto height = atom->writeFix16X16PointField("height", 4 * 8);
                                   currentStream_->tkhd.set_height(width);
                                   currentStream_->proto_stream.mutable_video_stream()->set_height(height);
                                   
                                   auto mvhd_ptr = std::dynamic_pointer_cast<MALMP4FormatPrivData>(malFormatContext_->priv);
                                   auto& mvhd = mvhd_ptr->mvhd;
                                   auto duratoin = std::round(currentStream_->tkhd.duration() * 1.0 / mvhd.timescale() * 1000000) / 1000000;
                                   currentStream_->proto_stream.set_duration(duratoin);
                               }));
    /**
     tref box可以描述两track之间关系。
     比如：一个MP4文件中有三条video track，ID分别是2、3、4，以及三条audio
     track，ID分别是6、7、8。 在播放track
     2视频时到底应该采用6、7、8哪条音频与其配套播放？这时候就需要在track 2与6的tref
     box中指定一下，将2与6两条track绑定起来。
     **/
    _parseTableEntry.push_back(std::make_tuple(
                                               "moov|trak|tref|hint|font|vdep|vplx|subt|trgr|msrc|mdia|minf|udta|edts|iprp|ipco|moof|traf|mvex|hoov",
                                               [this](std::shared_ptr<MALAtom> atom) {
                                                   if (atom->name == "trak") {
                                                       currentStream_ = std::make_shared<MALMP4Stream>();
                                                       malFormatContext_->addStream(currentStream_);
                                                   }
                                                   this->_parseChildAtom(atom);
                                               }));
    // full box
    _parseTableEntry.push_back(
                               std::make_tuple("meta", [this](std::shared_ptr<MALAtom> atom) {
                                   //meta 根据标准里边说的，应该是full box，但是有的是，有的不是，和ffmpeg一样，往后检测，找到hdlr
                                   while (!atom->dataSource->isEof() && atom->dataSource->readBytesString(4) != "hdlr") {}
                                   if (!atom->dataSource->isEof()) {
                                       atom->dataSource->seekBytes(-8);
                                       this->_parseChildAtom(atom);
                                   }
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("chpl", [this](std::shared_ptr<MALAtom> atom) {
                                   auto version = atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   if (version) {
                                       atom->writeField("reserve", 4 * 8);
                                   }
                                   auto nb_chapters = atom->writeField("nb_chapters", 1 * 8);
                                   for (int i = 0; i < nb_chapters; i++) {
                                       auto start = atom->writeField("start(timebase=10000000)", 8 * 8);
                                       auto str_len = atom->writeField("str_len", 1 * 8);
                                       if (str_len > 0) {
                                           atom->writeHexField("title", str_len * 8);
                                       }
                                   }
                                   malFormatContext_->addShallowWarning("存在chpl，如果不需要，转码时注意加上-ignore_chapters或者-map_chapters -1来移除，默认转码会创建一个新的track，有些不一定兼容这个track");
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("ilst", [this](std::shared_ptr<MALAtom> atom) {
                                   auto datasource = atom->dataSource;
                                   while (!datasource->isEof()) {
                                       int64_t current = datasource->currentBytesPosition();
                                       //下边也是一个一个的box
                                       int64_t atom_size = rbits_i(4 * 8);
                                       auto atom_type = rbytes_s(4);
                                       std::string key = "";
                                       if (atom_type == "\xa9""nam") {
                                           key = "title";
                                       } else if (atom_type == "\xa9""ART") {
                                           key = "artist";
                                       }
                                       datasource->seekBytes(current + atom_size,SEEK_SET);
                                   }
                                   
                                   
                               }));
    
    _parseTableEntry.push_back(std::make_tuple(
                                               "\xa9nam|\xa9too",
                                               [this](std::shared_ptr<MALAtom> atom) {
                                                   
                                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("mdhd", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   int creation_time_size = 4;
                                   int modification_time_size = 4;
                                   int timescale_size = 4;
                                   int duration_size = 4;
                                   if (version == 1) {
                                       creation_time_size = 8;
                                       modification_time_size = 8;
                                       timescale_size = 4;
                                       duration_size = 8;
                                   }
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("creation_time", creation_time_size * 8),
//                                       MALAtomField("modification_time", modification_time_size * 8),
//                                       MALAtomField("timescale", timescale_size * 8,MDPFieldDisplayType_int64,1, [=,&version](fast_any::any val) {
//                                           currentStream_->mdhd.set_timescale(*(val.as<uint64_t>()));
//                                           return val;
//                                       }),
//                                       MALAtomField("duration", duration_size * 8,MDPFieldDisplayType_int64,1, [=,&version](fast_any::any val) {
//                                           currentStream_->mdhd.set_duration(*(val.as<uint64_t>()));
//                                           return val;
//                                       }),
//                                       MALAtomField("pad_language", 2 * 8),
//                                       MALAtomField("pre_defined", 2 * 8),
//                                   };
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   atom->writeField<int64_t>("creation_time", creation_time_size * 8);
                                   atom->writeField<int64_t>("modification_time", modification_time_size * 8);
                                   auto timescale = atom->writeField<int64_t>("timescale", timescale_size * 8);
                                   currentStream_->mdhd.set_timescale(timescale);
                                   auto duration = atom->writeField<int64_t>("duration", duration_size * 8);
                                   currentStream_->mdhd.set_duration(duration);
                                   atom->writeField<int64_t>("pad_language", 2 * 8);
                                   atom->writeField<int64_t>("pre_defined", 2 * 8);
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("hdlr", [this](std::shared_ptr<MALAtom> atom) {
                                   std::string handler_type = "";
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("version", 1 * 8),
//                                       MALAtomField("flags", 3 * 8),
//                                       MALAtomField("pre_defined", 4 * 8),
//                                       MALAtomField("handler_type", 4 * 8,
//                                                    MDPFieldDisplayType_string,1,[&handler_type](fast_any::any val){
//                                           handler_type = *(val.as<std::string>());
//                                           return val;
//                                       }),
//                                       MALAtomField("reserved", 12 * 8,
//                                                    MDPFieldDisplayType_hex),
//                                   };
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   atom->writeField<int64_t>("version", 1 * 8);
                                   atom->writeField<int64_t>("flags", 3 * 8);
                                   atom->writeField<int64_t>("pre_defined", 4 * 8);
                                   handler_type =  atom->writeField<std::string>("handler_type", 4 * 8);
                                   atom->writeHexField("reserved", 12 * 8);
                                   
                                   
                                   std::string name = atom->writeField<std::string>("name", (atom->size - atom->dataSource->currentBytesPosition()) * 8);
                                   if (handler_type== "vide")  {
                                       currentStream_->proto_stream.set_media_type(proto::MAL_MEDIA_TYPE_VIDEO);
                                   } else if (handler_type == "soun") {
                                       currentStream_->proto_stream.set_media_type(proto::MAL_MEDIA_TYPE_AUDIO);
                                   } else if (handler_type == "pict") {
                                       auto parent = atom->parent.lock();
                                       if (parent && parent->name == "meta") {
                                           if (!currentStream_) {
                                               currentStream_ = std::make_shared<MALMP4Stream>();
                                               malFormatContext_->addStream(currentStream_);
                                           }
                                           currentStream_->proto_stream.set_media_type(proto::MAL_MEDIA_TYPE_STATIC_Image);
                                       }
                                       
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("elng", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   atom->writeField<std::string>(
                                                    "extended_language",
                                                    (atom->size - atom->dataSource->currentBytesPosition()) * 8);
                               }));
    
    _parseTableEntry.push_back(
                               std::make_tuple("encv", [this](std::shared_ptr<MALAtom> atom) {
                                   malFormatContext_->addShallowError("包含encv，加密视频无法播放");
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stbl", [this](std::shared_ptr<MALAtom> atom) {
                                   this->_parseChildAtom(atom);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stsd", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   unsigned char *entry_count_cr = atom->dataSource->readBytesRaw(4);
                                   int entry_count = (int)(((entry_count_cr[0] & 0xFF) << 24) |
                                                           ((entry_count_cr[1] & 0xFF) << 16) |
                                                           ((entry_count_cr[2] & 0xFF) << 8) |
                                                           (entry_count_cr[3] & 0xFF));
                                   for (int i = 1; i <= entry_count; i++) {
                                       this->_parseChildAtom(atom);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("mp4a|ipcm|fpcm", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = 0;
                                   atom->writeField("reserved", 6 * 8);
                                   atom->writeField("data_reference_index", 2 * 8);
                                   version = atom->writeField("version", 2 * 8);
                                   atom->writeField("reserved", 6 * 8);
                                   atom->writeField("channelcount", 2 * 8);
                                   atom->writeField("samplesize", 2 * 8);
                                   atom->writeField("pre_defined", 2 * 8);
                                   atom->writeField("reserved", 2 * 8);
                                   
                                 
                                   atom->writeField<int64_t>("samplerate", 4 * 8,1,
                                                    ">>16", [this](int64_t old) {
                                       uint64_t val = old;
                                       val = (val >> 16);
                                       return val;
                                   });
                                   if (version == 1) { //这里是否需要判断compatible_brands 为qt,ffmpeg是判断了
                                       atom->writeField("samples_per_frame", 4 * 8);
                                       atom->writeField("bytes_per_packet", 4 * 8);
                                       atom->writeField("bytes_per_frame", 4 * 8);
                                       atom->writeField("bytes_per_sample", 4 * 8);
                                   } else if (version == 2) {
                                       atom->writeField("sizeof_struct_only", 4 * 8);
                                       atom->writeField<double>("sample_rate", 8 * 8);
                                       atom->writeField("channels", 4 * 8);
                                       atom->writeField("reserved", 4 * 8,1,"always 0x7F000000");
                                       atom->writeField("bits_per_coded_sample", 4 * 8);
                                       atom->writeField("flags", 4 * 8);
                                       atom->writeField("bytes_per_frame", 4 * 8);
                                       atom->writeField("samples_per_frame", 4 * 8);
                                   }
                                   this->_parseChildAtom(atom);
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("esds", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   auto tag = atom->writeField("tag", 1 * 8);
                                   int len = parse_esds_len(atom->dataSource);
                                   if (tag == 0x03) { //ES_Descriptor
                                       atom->writeValueField<std::string>("", "----------------ES_Descriptor");
                                       atom->writeField("es_id", 2 * 8);
                                       auto streamDependenceFlag = atom->writeField("streamDependenceFlag", 1);
                                       auto URL_Flag = atom->writeField("URL_Flag", 1);
                                       auto OCRstreamFlag = atom->writeField("OCRstreamFlag", 1);
                                       auto streamPriority = atom->writeField("streamPriority", 5);
                                       if (streamDependenceFlag) {
                                           atom->writeField("dependsOn_ES_ID", 2 * 8);
                                       }
                                       if (URL_Flag) {
                                           auto URLlength = atom->writeField("URLlength", 1 * 8);
                                           atom->writeHexField("URLstring", URLlength * 8);
                                       }
                                       if (OCRstreamFlag) {
                                           atom->writeField("OCR_ES_Id", 2 * 8);
                                       }
                                       auto tag = atom->writeField("tag", 1 * 8);
                                       len = parse_esds_len(atom->dataSource);
                                       if (tag == 0x04) { //DecoderConfigDescrTag
                                           atom->writeValueField<std::string>("", "----------------DecoderConfigDescrTag");
                                           auto objectTypeIndication = atom->writeField("objectTypeIndication", 1 * 8);
                                           atom->writeField("streamType", 6);
                                           atom->writeField("upStream", 1);
                                           atom->writeField("reserved", 1);
                                           atom->writeField("bufferSizeDB", 3 * 8);
                                           atom->writeField("maxBitrate", 4 * 8);
                                           atom->writeField("avgBitrate", 4 * 8);
                                           auto tag = atom->writeField("tag", 1 * 8);
                                           len = parse_esds_len(atom->dataSource);
                                           if (tag == 0x05) { // DecSpecificInfoTag
                                               atom->writeValueField<std::string>("", "----------------DecSpecificInfoTag");
                                               if (objectTypeIndication == 0x40) { //Audio ISO/IEC 14496-3 AudioSpecificConfig
                                                   atom->writeValueField<std::string>("", "----------------AudioSpecificConfig");
                                                   auto audioObjectType = atom->dataSource->readBitsInt64(5);
                                                   if (audioObjectType == 31) {
                                                       auto audioObjectTypeExt = atom->dataSource->readBitsInt64(6);
                                                       audioObjectType = audioObjectType + audioObjectTypeExt;
                                                   }
                                                   atom->writeValueField<uint64_t>("audioObjectType", audioObjectType);
                                                   int samplingFrequencyIndexMaps[] = {
                                                       96000,88200,64000,48000,44100,32000,24000,22050,16000,12000,11025,8000,7350,-1,-1,-1
                                                   };
                                                   auto samplingFrequencyIndex = atom->writeField("samplingFrequencyIndex", 4);
                                                   if (samplingFrequencyIndex == 0x0f) {
                                                       auto samplingFrequency = atom->writeField("samplingFrequency", 3 * 8);
                                                   }
                                                   auto channelConfiguration = atom->writeField("channelConfiguration", 4);
                                                   int sbrPresentFlag = -1, psPresentFlag = -1, mpsPresentFlag = -1, saocPresentFlag = -1, IdmpsPresentFlag = -1, saocDePresentFlag = -1, extensionAudioObjectType = -1;
                                                   if (audioObjectType == 5 || audioObjectType == 29) {
                                                       extensionAudioObjectType = 5;
                                                       sbrPresentFlag = 1;
                                                       if (audioObjectType == 29) {
                                                           psPresentFlag = 1;
                                                       }
                                                       auto extensionSamplingFrequencyIndex = atom->writeField("extensionSamplingFrequencyIndex", 4);
                                                       if (extensionSamplingFrequencyIndex == 0x0f) {
                                                           atom->writeField("extensionSamplingFrequency", 3 * 8);
                                                       }
                                                       audioObjectType = atom->dataSource->readBitsInt64(5);
                                                       if (audioObjectType == 31) {
                                                           auto audioObjectTypeExt = atom->dataSource->readBitsInt64(6);
                                                           audioObjectType = audioObjectType + audioObjectTypeExt;
                                                       }
                                                       atom->writeValueField<uint64_t>("audioObjectType(use)", audioObjectType);
                                                       if (audioObjectType == 22) {
                                                           atom->writeField("extensionChannelConfiguration", 4);
                                                       }
                                                   } else {
                                                       extensionAudioObjectType = 0;
                                                   }
                                                   switch (audioObjectType) {
                                                       case 1:
                                                       case 2:
                                                       case 3:
                                                       case 4:
                                                       case 6:
                                                       case 7:
                                                       case 17:
                                                       case 19:
                                                       case 20:
                                                       case 21:
                                                       case 22:
                                                       case 23:
                                                       {
                                                           atom->writeValueField<std::string>("", "----------------GASpecificConfig0");
                                                           atom->writeField("frameLengthFlag", 1);
                                                           auto dependsOnCoreCoder = atom->writeField("dependsOnCoreCoder", 1);
                                                           if (dependsOnCoreCoder) {
                                                               atom->writeField("coreCoderDelay", 14);
                                                           }
                                                           auto extensionFlag = atom->writeField("extensionFlag", 1);
                                                           if (!channelConfiguration) {
                                                               atom->writeValueField<std::string>("", "----------------program_config_element");
                                                               atom->writeField("element_instance_tag", 4);
                                                               auto object_type = atom->writeField("object_type", 2);
                                                               auto sampling_frequency_index = atom->writeField("sampling_frequency_index", 4);
                                                               auto num_front_channel_elements = atom->writeField("num_front_channel_elements", 4);
                                                               auto num_side_channel_elements = atom->writeField("num_side_channel_elements;", 4);
                                                               auto num_back_channel_elements = atom->writeField("num_back_channel_elements", 4);
                                                               auto num_Ife_channel_elements = atom->writeField("num_Ife_channel_elements", 2);
                                                               auto num_assoc_data_elements = atom->writeField("num_assoc_data_elements", 3);
                                                               auto num_valid_cc_elements = atom->writeField("num_valid_cc_elements", 4);
                                                               auto mono_mixdown_present = atom->writeField("mono_mixdown_present", 1);
                                                               if (mono_mixdown_present == 1) {
                                                                   atom->writeField("mono_mixdown_element_number", 4);
                                                               }
                                                               auto stereo_mixdown_present = atom->writeField("stereo_mixdown_present", 1);
                                                               if (stereo_mixdown_present == 1) {
                                                                   atom->writeField("stereo_mixdown_element_number", 4);
                                                               }
                                                               auto matrix_mixdown_idx_present = atom->writeField("matrix_mixdown_idx_present", 1);
                                                               if (matrix_mixdown_idx_present) {
                                                                   atom->writeField("matrix_mixdown_idx", 2);
                                                                   atom->writeField("pseudo_surround_enable", 1);
                                                               }
                                                               for (int i = 0; i <num_front_channel_elements; i++) {
                                                                   atom->writeField(fmt::format("front_element_is_cpe[{}]",i),1);
                                                                   atom->writeField(fmt::format("front_element_tag_selecti[{}]",i),4);
                                                               }
                                                               for (int i = 0; i <num_side_channel_elements; i++) {
                                                                   atom->writeField(fmt::format("side_element_is_cpe[{}]",i),1);
                                                                   atom->writeField(fmt::format("side_element_tag_select[{}]",i),4);
                                                               }
                                                               for (int i = 0; i <num_back_channel_elements; i++) {
                                                                   atom->writeField(fmt::format("back_element_is_cpe[{}]",i),1);
                                                                   atom->writeField(fmt::format("back_element_tag_select[{}]",i),4);
                                                               }
                                                               for (int i = 0; i <num_Ife_channel_elements; i++) {
                                                                   atom->writeField(fmt::format("Ife_element_tag_select[{}]",i),4);
                                                               }
                                                               for (int i = 0; i <num_assoc_data_elements; i++) {
                                                                   atom->writeField(fmt::format("assoc_data_element_tag_select[{}]",i),4);
                                                               }
                                                               for (int i = 0; i <num_valid_cc_elements; i++) {
                                                                   atom->writeField(fmt::format("cc_element_is_ind_sw[{}]",i),1);
                                                                   atom->writeField(fmt::format("valid_cc_element_tag_select[{}]",i),4);
                                                               }
                                                               atom->dataSource->byteAlignment();
                                                               auto comment_field_bytes = atom->writeField("comment_field_bytes",8);
                                                               for (int i = 0; i < comment_field_bytes; i++) {
                                                                   atom->writeField(fmt::format("comment_field _data[{}]",i),8);
                                                               }
                                                           }
                                                           if ((audioObjectType == 6) || (audioObjectType == 20)) {
                                                               atom->writeField("layerNr", 3);
                                                           }
                                                           if (extensionFlag) {
                                                               if (audioObjectType == 22) {
                                                                   atom->writeField("numOfSubFrame", 5);
                                                                   atom->writeField("layer_length", 11);
                                                               }
                                                               if (audioObjectType == 17 || audioObjectType == 19 || audioObjectType == 20 || audioObjectType == 23) {
                                                                   atom->writeField("aacSectionDataResilienceFlag", 1);
                                                                   atom->writeField("aacScalefactorDataResilienceFlag", 1);
                                                                   atom->writeField("aacSpectralDataResilienceFlag", 1);
                                                               }
                                                               atom->writeField("extensionFlag3", 1);
                                                           }
                                                           break;
                                                       }
                                                          
                                                       default:
                                                           break;
                                                   }
                                               }
                                           }
                                       }
                                   }
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("avc1|avc2", [this](std::shared_ptr<MALAtom> atom) {
                                   if (currentStream_->videoConfig.size() > 0) {
                                       malFormatContext_->addShallowWarning("stsd下存在多个avc1/avc2 box，视频播放可能存在兼容问题");
                                   }
                                   auto avcc = std::make_shared<MALAVCC>();
                                   currentStream_->videoConfig.push_back(avcc);
                                   currentStream_->proto_stream.set_video_codec(proto::MAL_VIDEO_CODEC_H264);
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("reserved", 6 * 8),
//                                       MALAtomField("data_reference_index", 2 * 8),
//                                       MALAtomField("pre_defined", 2 * 8),
//                                       MALAtomField("reserved", 2 * 8),
//                                       MALAtomField("pre_defined", 12 * 8),
//                                       MALAtomField("width", 2 * 8,MDPFieldDisplayType_int64,1,[this](fast_any::any any) {
//                                           avcc->proto_config.set_width((int)(*(any.as<uint64_t>())));
//                                           return any;
//                                       }),
//                                       MALAtomField("height", 2 * 8,MDPFieldDisplayType_int64,1,[this](fast_any::any any) {
//                                           avcc->proto_config.set_height((int)(*(any.as<uint64_t>())));
//                                           return any;
//                                       }),
//                                       MALAtomField("horizresolution", 4 * 8),
//                                       MALAtomField("vertresolution", 4 * 8),
//                                       MALAtomField("reserved", 4 * 8),
//                                       MALAtomField("frame_count", 2 * 8),
//                                       MALAtomField("compressorname", 32 * 8,
//                                                    MDPFieldDisplayType_string),
//                                       MALAtomField("depth", 2 * 8),
//                                       MALAtomField("pre_defined", 2 * 8),
//                                       
//                                   };
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   
                                   atom->writeField("reserved", 6 * 8);
                                   atom->writeField("data_reference_index", 2 * 8);
                                   atom->writeField("pre_defined", 2 * 8);
                                   atom->writeField("reserved", 2 * 8);
                                   atom->writeHexField("pre_defined", 12 * 8);
                                   auto width =  atom->writeField("width", 2 *8 );
                                   auto height = atom->writeField("height", 2 * 8);
                                   avcc->proto_config.set_width(width);
                                   avcc->proto_config.set_height(height);
                                   atom->writeField("horizresolution", 4 * 8);
                                   atom->writeField("vertresolution", 4 * 8);
                                   atom->writeField("reserved", 4 * 8);
                                   atom->writeField("frame_count", 2 * 8);
                                   atom->writeField<std::string>("compressorname", 32 * 8);
                                   atom->writeField("depth", 2 * 8);
                                   atom->writeField("pre_defined", 2 * 8);
                                   
                                   
                                   this->_parseChildAtom(atom);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("avcC", [this](std::shared_ptr<MALAtom> atom) {
                                   int64_t lastBytes = atom->dataSource->totalSize() - atom->dataSource->currentBytesPosition();
                                   auto avcc_datasource = atom->dataSource->readBytesStream(lastBytes,true);
                                   if (currentStream_->video_config_future_.valid()) {
                                       mdp_video_header *header = currentStream_->video_config_future_.get();
                                       if (header) {
                                           currentStream_->video_configs_.push_back(header);
                                       }
                                   }
                                   currentStream_->video_config_future_ = std::async(std::launch::async, [=,this](){
                                       MALCodecParser codecParser(avcc_datasource, malFormatContext_, currentStream_, currentStream_->currentConfig());
                                       mdp_video_header * video_config_ = codecParser.parse_avcc();
                                       return video_config_;
                                   });
                                   uint64_t numOfSequenceParameterSets = 0;
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("configurationVersion", 1 * 8),
//                                       MALAtomField("AVCProfileIndication", 1 * 8),
//                                       MALAtomField("profile_compatibility", 1 * 8),
//                                       MALAtomField("AVCLevelIndication", 1 * 8),
//                                       
//                                       MALAtomField("reserved", 6),
//                                       MALAtomField("lengthSizeMinusOne", 2,MDPFieldDisplayType_int64,1,[this](fast_any::any any) {
//                                           currentStream_->currentConfig()->proto_config.set_length_size_minus_one((int)(*(any.as<uint64_t>())));
//                                           return any;
//                                       }),
//                                       
//                                       MALAtomField("reserved", 3),
//                                       MALAtomField("numOfSequenceParameterSets", 5,
//                                                    MDPFieldDisplayType_int64,1,
//                                                    [=, &numOfSequenceParameterSets](fast_any::any val) {
//                                           uint64_t ori = *(val.as<uint64_t>());
//                                           numOfSequenceParameterSets = ori;
//                                           return val;
//                                       }),
//                                   };
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   
                                   atom->writeField("configurationVersion", 1 * 8);
                                   atom->writeField("AVCProfileIndication", 1 * 8);
                                   atom->writeField("profile_compatibility", 1 * 8);
                                   atom->writeField("AVCLevelIndication", 1 * 8);
                                   
                                   atom->writeField("reserved", 6);
                                   auto lengthSizeMinusOne = atom->writeField("lengthSizeMinusOne", 2);
                                   currentStream_->currentConfig()->proto_config.set_length_size_minus_one(lengthSizeMinusOne);
                                   
                                   atom->writeField("reserved", 3);
                                   numOfSequenceParameterSets = atom->writeField("numOfSequenceParameterSets", 5);
                                   
                                   
                                   
                                   for (int i = 0; i < numOfSequenceParameterSets; i++) {
                                       uint64_t sequenceParameterSetLength =
                                       atom->writeField<uint64_t>("sequenceParameterSetLength", 2 * 8);
                                       //                                       atom->dataSource->skipBytes(sequenceParameterSetLength);
                                       atom->writeHexField("sps_nal_data",sequenceParameterSetLength * 8);
                                   }
                                   uint64_t numOfPictureParameterSets =
                                   atom->writeField<uint64_t>("numOfPictureParameterSets", 1 * 8);
                                   for (int i = 0; i < numOfPictureParameterSets; i++) {
                                       uint64_t pictureParameterSetLength =
                                       atom->writeField<uint64_t>("pictureParameterSetLength", 2 * 8);
                                       //                                       atom->dataSource->skipBytes(pictureParameterSetLength);
                                       atom->writeHexField("pps_nal_data",pictureParameterSetLength * 8);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("colr", [this](std::shared_ptr<MALAtom> atom) {
                                   auto colour_type = atom->writeField<std::string>("colour_type", 4 * 8);
                                   if (colour_type == "nclx") {
                                       malFormatContext_->addShallowWarning(fmt::format("第{}个stream中存在colr，里边包含nclx描述，注意是否和sps中的colorspace描述是否一致，如果这里的colorspace都不是UNSPECIFIED，ffmpeg(8/6/2025)以这个为准，具体可以看parameters_from_context方法,8/6/2025之前的ffmpeg没有这个逻辑，会被sps中的覆盖",currentStream_->proto_stream.index()));
                                       atom->writeField("colour_primaries", 2 * 8);
                                       atom->writeField("transfer_characteristics", 2 * 8);
                                       atom->writeField("matrix_coefficients", 2 * 8);
                                       atom->writeField("full_range_flag", 1);
                                       atom->writeField("reserved", 7);
                                   } else if (colour_type == "rICC") {
                                       malFormatContext_->addShallowWarning(fmt::format("第{}个stream中存在colr，里边包含ICCProfile描述，注意是否偏色",currentStream_->proto_stream.index()));
                                   } else if (colour_type == "prof") {
                                       malFormatContext_->addShallowWarning(fmt::format("第{}个stream中存在colr，里边包含prof描述，注意是否偏色",currentStream_->proto_stream.index()));
                                   } else {
                                       malFormatContext_->addShallowWarning(fmt::format("第{}个stream中存在colr，但是colour_type:{}不在nclx/rICC/prof中",currentStream_->proto_stream.index(), colour_type));
                                   }
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("elst", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   int segment_duration_size = 4;
                                   int media_time_size = 4;
                                   if (version == 1) {
                                       segment_duration_size = 8;
                                       media_time_size = 8;
                                   }
                                   for (int i = 1; i <= entry_count; i++) {
                                       uint64_t duration = atom->writeField<uint64_t>("segment_duration", segment_duration_size * 8);
                                       
                                       int64_t media_time = 0;
                                       if (media_time_size == 4) {
                                           media_time = atom->writeField<int32_t>("media_time", media_time_size * 8);
                                       } else {
                                           media_time = atom->writeField<int64_t>("media_time", media_time_size * 8);
                                       }
                                       
                                       uint64_t rate_integer = atom->writeField<uint64_t>("media_rate_integer", 2 * 8);
                                       uint64_t rate_fraction = atom->writeField<uint64_t>("media_rate_fraction", 2 * 8);
                                       currentStream_->elst.push_back({duration,media_time,rate_integer,rate_fraction});
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stts", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for (int i = 0; i < entry_count; i++) {
                                       uint64_t count = atom->writeField<uint64_t>(fmt::format("sample_count[{}]", i), 4 * 8);
                                       uint64_t offset = atom->writeField<uint64_t>(fmt::format("sample_delta[{}]", i), 4 * 8);
                                       currentStream_->stts.push_back({count,offset});
                                   }
                                   if (currentStream_->proto_stream.media_type() == proto::MAL_MEDIA_TYPE_VIDEO) {
                                       if (entry_count == 1) {
                                           currentStream_->proto_stream.mutable_video_stream()->set_sync("CFR");
                                       } else {
                                           currentStream_->proto_stream.mutable_video_stream()->set_sync("VFR");
                                       }
                                       
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stss", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for (int i = 0; i < entry_count; i++) {
                                       auto sample_number = atom->writeField<uint64_t>(fmt::format("sample_number[{}]", i), 4 * 8);
                                       currentStream_->stss.push_back(sample_number);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("ctts", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for (int i = 0; i < entry_count; i++) {
                                       int32_t count = atom->writeField<int32_t>(fmt::format("sample_count[{}]", i), 4 * 8);
                                       int32_t offset = atom->writeField<int32_t>(fmt::format("sample_offset[{}]", i), 4 * 8);
                                       currentStream_->ctts.push_back({count,offset});
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stsh", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for (int i = 0; i < entry_count; i++) {
                                       atom->writeField(fmt::format("shadowed_sample_number[{}]", i), 4 * 8);
                                       atom->writeField(fmt::format("sync_sample_number[{}]", i), 4 * 8);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stco", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for (int i = 0; i < entry_count; i++) {
                                       uint64_t chunk_offset = atom->writeField<uint64_t>(fmt::format("chunk_offset[{}]", i), 4 * 8);
                                       currentStream_->stco.push_back(chunk_offset);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("co64", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for (int i = 0; i < entry_count; i++) {
                                       uint64_t chunk_offset = atom->writeField<uint64_t>(fmt::format("chunk_offset[{}]", i), 8 * 8);
                                       currentStream_->stco.push_back(chunk_offset);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stsc", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for (int i = 0; i < entry_count; i++) {
                                       auto first_chunk = atom->writeField<uint64_t>(fmt::format("first_chunk[{}]", i), 4 * 8);
                                       auto samples_per_chunk =atom->writeField<uint64_t>(fmt::format("samples_per_chunk[{}]", i), 4 * 8);
                                       auto sample_description_index = atom->writeField<uint64_t>(fmt::format("sample_description_index[{}]", i),
                                                        4 * 8);
                                       currentStream_->stsc.push_back({first_chunk,samples_per_chunk,sample_description_index});
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("stsz", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t sample_size = atom->writeField<uint64_t>("sample_size", 4 * 8);
                                   uint64_t sample_count = atom->writeField<uint64_t>("sample_count", 4 * 8);
                                   double total_size = 0;
                                   if (sample_size == 0) {
                                       for (int i = 0; i < sample_count; i++) {
                                           auto entry_size = atom->writeField<uint64_t>(fmt::format("entry_size[{}]", i), 4 * 8);
                                           total_size += entry_size;
                                           int64_t max_size = std::max(entry_size, (uint64_t)currentStream_->proto_stream.max_sample_size());
                                           currentStream_->proto_stream.set_max_sample_size(max_size);
                                           currentStream_->stsz.push_back(entry_size);
                                       }
                                       if (!atom->dataSource->isEof()) {
                                           int64_t index = sample_count;
                                           while (!atom->dataSource->isEof()) {
                                               auto entry_size = atom->writeField<uint64_t>(fmt::format("entry_size[{}]", index), 4 * 8);
                                               total_size += entry_size;
                                               int64_t max_size = std::max(entry_size, (uint64_t)currentStream_->proto_stream.max_sample_size());
                                               currentStream_->proto_stream.set_max_sample_size(max_size);
                                               currentStream_->stsz.push_back(entry_size);
                                               index++;
                                           }
                                           malFormatContext_->addShallowWarning(fmt::format("stsz标记有{}个帧，但是实际有个{}帧",sample_count,index));
                                       }
                                   }
                                   currentStream_->proto_stream.set_total_frames(sample_count);
                                   currentStream_->proto_stream.set_bitrate(std::round(total_size * 8 * 1.0/currentStream_->proto_stream.duration() * 1000)/1000000);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("pitm", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   int size = 0;
                                   if (!version) {
                                       size = 2;
                                   } else {
                                       size = 4;
                                   }
                                   auto item_ID = atom->writeField("item_ID", size * 8);
                                   pitm_id_ = item_ID;
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("iloc", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   uint64_t offset_size = atom->writeField<uint64_t>("offset_size", 4);
                                   uint64_t length_size = atom->writeField<uint64_t>("length_size", 4);
                                   uint64_t base_offset_size =
                                   atom->writeField<uint64_t>("base_offset_size", 4);
                                   uint64_t index_size = 0;
                                   if (version == 1 || version == 2) {
                                       index_size = atom->writeField<uint64_t>("index_size", 4);
                                   } else {
                                       atom->writeField("reserved", 4);
                                   }
                                   int item_count = 0;
                                   int item_count_size = 0;
                                   if (version < 2) {
                                       item_count_size = 2;
                                   } else {
                                       item_count_size = 4;
                                   }
                                   item_count =
                                   atom->writeField<uint64_t>("item_count", item_count_size * 8);
                                   for (int i = 0; i < item_count; i++) {
                                       int item_id_size = 0;
                                       if (version < 2) {
                                           item_id_size = 2;
                                       } else {
                                           item_id_size = 4;
                                       }
                                       atom->writeField("item_id", item_id_size * 8);
                                       if (version == 1 || version == 2) {
                                           atom->writeField("reserved", 12);
                                           atom->writeField("construction_method", 4);
                                       }
                                       atom->writeField("data_reference_index", 2 * 8);
                                       atom->writeField("base_offset", base_offset_size * 8);
                                       uint64_t extent_count = atom->writeField<uint64_t>("extent_count", 2 * 8);
                                       for (int j = 0; j < extent_count; j++) {
                                           if ((version == 1 || version == 2) && (index_size > 0)) {
                                               atom->writeField("extent_index", index_size * 8);
                                           }
                                           atom->writeField("extent_offset", offset_size * 8);
                                           atom->writeField("extent_length", length_size * 8);
                                       }
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("iinf", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   int entry_count_size = version == 0 ? 2 : 4;
                                   atom->writeField("entry_count", entry_count_size * 8);
                                   this->_parseChildAtom(atom);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("infe", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   if (version == 0 || version == 1) {
                                       auto item_id = atom->writeField("item_id", 2 * 8);
                                       atom->writeField("item_protection_index", 2 * 8);
                                       std::vector<std::string> names = {"item_name","content_type","content_encoding"};
                                       for (auto& name : names) {
                                           int64_t size = atom->dataSource->nextNonNullLength();
                                           if (size > 0) {
                                               auto val = atom->writeField<std::string>(name, size * 8);
                                               if (name == "content_type") {
                                                   infes_[item_id] = val;
                                               }
                                           }
                                       }
                                   }
                                   if (version == 1) {
                                       atom->writeField("extension_type", 4 * 8);
                                       this->_parseChildAtom(atom,true); //ItemInfoExtension
                                   }
                                   if (version >= 2) {
                                       int item_ID_size = version == 2 ? 2:4;
                                       auto item_id =  atom->writeField("item_ID", item_ID_size * 8);
                                       atom->writeField("item_protection_index", 2 * 8);
                                       auto item_type = atom->writeField<std::string>("item_type", 4 * 8);
                                       infes_[item_id] = item_type;
                                   }
                                   
                                   int64_t size = atom->dataSource->nextNonNullLength();
                                   std::string item_name = "";
                                   if (size > 0) {
                                       item_name = atom->writeField<std::string>("item_name", size * 8);
                                   }
                                   std::vector<std::string> names = {};
                                   if (item_name == "mime") {
                                       names = {"content_type","content_encoding"};
                                   } else if (item_name == "uri") {
                                       names = {"item_uri_type"};
                                   }
                                   for (auto& name : names) {
                                       int64_t size = atom->dataSource->nextNonNullLength();
                                       if (size > 0) {
                                           atom->writeField<std::string>(name, size * 8);
                                       }
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("iref", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   this->iref_version_ = version;
                                   atom->writeField("flags", 3 * 8);
                                   this->_parseChildAtom(atom);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("thmb|dimg|auxl", [this](std::shared_ptr<MALAtom> atom) {
                                   int from_item_ID_bytes = 2;
                                   int reference_count_bytes = 2;
                                   int to_item_ID_bytes = 2;
                                   if (this->iref_version_ != 0) {
                                       from_item_ID_bytes = 4;
                                       to_item_ID_bytes = 4;
                                   }
                                   auto from_item_ID =  atom->writeField("from_item_ID", from_item_ID_bytes * 8);
                                   uint64_t reference_count = atom->writeField<uint64_t>("reference_count", reference_count_bytes * 8);
                                   std::vector<int> to_item_IDs;
                                   for (int j = 0; j < reference_count; j++) {
                                       auto to_item_ID = atom->writeField("to_item_ID", to_item_ID_bytes * 8);
                                       to_item_IDs.push_back(to_item_ID);
                                   }
                                   dimg[from_item_ID] = to_item_IDs;
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("cdsc", [this](std::shared_ptr<MALAtom> atom) {
                                   atom->writeField("track_IDs", 4 * 8);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("ipma", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   uint64_t flags = atom->writeField<uint64_t>("flags", 3 * 8);
                                   uint64_t entry_count = atom->writeField<uint64_t>("entry_count", 4 * 8);
                                   for(int i = 0; i < entry_count; i++) {
                                       int item_id_size = version < 1 ? 2 : 4;
                                       auto item_id = atom->writeField("item_ID", item_id_size * 8);
                                       uint64_t association_count = atom->writeField<uint64_t>("association_count", 1 * 8);
                                       std::vector<int> property_indexs;
                                       for(int i = 0; i<association_count;i++) {
                                           atom->writeField("essential", 1); //必不可少的
                                           int bits = 7;
                                           if(flags & 1) {
                                               bits = 15;
                                           }
                                           auto property_index = atom->writeField("property_index", bits);
                                           property_indexs.push_back(property_index);
                                       }
                                       ipma[item_id] = property_indexs;
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("sidx", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   atom->writeField("reference_ID", 4 * 8);
                                   atom->writeField("timescale", 4 * 8);
                                   int earliest_presentation_time_size = 4;
                                   int first_offset_size = 4;
                                   if(version != 0) {
                                       earliest_presentation_time_size = 8;
                                       first_offset_size = 8;
                                   }
                                   atom->writeField("earliest_presentation_time", earliest_presentation_time_size * 8);
                                   atom->writeField("first_offset", first_offset_size * 8);
                                   atom->writeField("reserved", 2 * 8);
                                   uint64_t reference_count = atom->writeField<uint64_t>("reference_count", 2 * 8);
                                   for(int i = 0; i < reference_count; i++) {
                                       atom->writeField("reference_type", 1);
                                       atom->writeField("referenced_size", 31);
                                       atom->writeField("subsegment_duration", 32);
                                       atom->writeField("starts_with_SAP", 1);
                                       atom->writeField("SAP_type", 3);
                                       atom->writeField("SAP_delta_time", 28);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("tfhd", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   uint64_t flags = atom->writeField<uint64_t>("flags", 3 * 8);
                                   uint64_t track_ID = atom->writeField<uint64_t>("track_ID", 4 * 8);
                                   if(flags & 0x01 ) {
                                       atom->writeField("base_data_offset", 8 * 8);
                                   }
                                   if(flags & 0x02 ) {
                                       atom->writeField("sample_description_index", 4 * 8);
                                   }
                                   if(flags & 0x08 ) {
                                       atom->writeField("default_sample_duration", 4 * 8);
                                   }
                                   if(flags & 0x10 ) {
                                       atom->writeField("default_sample_size", 4 * 8);
                                   }
                                   if(flags & 0x20 ) {
                                       atom->writeField("default_sample_flags", 4 * 8);
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("trun", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   uint64_t flags = atom->writeField<uint64_t>("flags", 3 * 8);
                                   uint64_t sample_count = atom->writeField<uint64_t>("sample_count", 4 * 8);
                                   if(flags & 0x000001) {
                                       atom->writeField("data_offset", 4 * 8);
                                   }
                                   if(flags & 0x000004) {
                                       atom->writeField("first_sample_flags", 4 * 8);
                                   }
                                   for(int i = 0; i< sample_count; i++) {
                                       if(flags & 0x000100) {
                                           atom->writeField("sample_duration", 4 * 8);
                                       }
                                       if(flags & 0x000200) {
                                           atom->writeField("sample_size", 4 * 8);
                                       }
                                       if(flags & 0x000400) {
                                           atom->writeField("sample_flags", 4 * 8);
                                       }
                                       if(flags & 0x000800) {
                                           atom->writeField("sample_composition_time_offset", 4 * 8);
                                       }
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("trex", [this](std::shared_ptr<MALAtom> atom) {
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("version", 1 * 8),
//                                       MALAtomField("flags", 3 * 8),
//                                       MALAtomField("track_ID", 4 * 8),
//                                       MALAtomField("default_sample_description_index", 4 * 8),
//                                       MALAtomField("default_sample_duration", 4 * 8),
//                                       MALAtomField("default_sample_size", 4 * 8),
//                                       MALAtomField("default_sample_flags", 4 * 8),
//                                   };
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   
                                   atom->writeField("version", 1 * 8);
                                   atom->writeField("flags", 3 * 8);
                                   atom->writeField("track_ID", 4 * 8);
                                   atom->writeField("default_sample_description_index", 4 * 8);
                                   atom->writeField("default_sample_duration", 4 * 8);
                                   atom->writeField("default_sample_size", 4 * 8);
                                   atom->writeField("default_sample_flags", 4 * 8);
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("tfdt", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   uint64_t flags = atom->writeField<uint64_t>("flags", 3 * 8);
                                   int baseMediaDecodeTimeSize = 4;
                                   if(version == 1) {
                                       baseMediaDecodeTimeSize = 8;
                                   }
                                   atom->writeField("baseMediaDecodeTime", baseMediaDecodeTimeSize * 8);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("mfhd", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   uint64_t flags = atom->writeField<uint64_t>("flags", 3 * 8);
                                   atom->writeField("sequence_number", 4 * 8);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("hvc1|hev1|dvh1", [this](std::shared_ptr<MALAtom> atom) {
                                   if (currentStream_->videoConfig.size() > 0) {
                                       malFormatContext_->addShallowWarning("stsd下存在多个hvc1/hev1 box，视频播放可能存在兼容问题");
                                   }
                                   if (atom->name == "hev1") {
                                       malFormatContext_->addShallowWarning("video tag 是hev1，视频在mac无法播放，请注意修改");
                                   }
                                   auto hvcc = std::make_shared<MALHVCC>();
                                   currentStream_->videoConfig.push_back(hvcc);
                                   currentStream_->proto_stream.set_video_codec(proto::MAL_VIDEO_CODEC_H265);
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("reserved", 6 * 8),
//                                       MALAtomField("data_reference_index", 2 * 8),
//                                       MALAtomField("pre_defined", 2 * 8),
//                                       MALAtomField("reserved", 2 * 8),
//                                       MALAtomField("pre_defined", 12 * 8),
//                                       MALAtomField("width", 2 * 8,MDPFieldDisplayType_int64,1,[this](fast_any::any any) {
//                                           hvcc->proto_config.set_width(((int)(*(any.as<uint64_t>()))));
//                                           return any;
//                                       }),
//                                       MALAtomField("height", 2 * 8,MDPFieldDisplayType_int64,1,[this](fast_any::any any) {
//                                           hvcc->proto_config.set_height((int)(*(any.as<uint64_t>())));
//                                           return any;
//                                       }),
//                                       MALAtomField("horizresolution", 4 * 8, MDPFieldDisplayType_hex), //0x00480000; // 72 dpi
//                                       MALAtomField("vertresolution", 4 * 8, MDPFieldDisplayType_hex),
//                                       MALAtomField("reserved", 4 * 8),
//                                       MALAtomField("frame_count", 2 * 8),
//                                       MALAtomField("compressorname", 32 * 8, MDPFieldDisplayType_string),
//                                       MALAtomField("depth", 2 * 8),
//                                       MALAtomField("pre_defined", 2 * 8),
//                                   };
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   
                                  
                                   atom->writeField("reserved", 6 * 8);
                                   atom->writeField("data_reference_index", 2 * 8);
                                   atom->writeField("pre_defined", 2 * 8);
                                   atom->writeField("reserved", 2 * 8);
                                   atom->writeField("pre_defined", 12 * 8);
                                   auto width =  atom->writeField("width", 2 * 8);
                                   hvcc->proto_config.set_width(width);
                                   auto height = atom->writeField("height", 2 * 8);
                                   hvcc->proto_config.set_height(height);
                                   atom->writeHexField("horizresolution", 4 * 8); //0x00480000; // 72 dpi
                                   atom->writeHexField("vertresolution", 4 * 8);
                                   atom->writeField("reserved", 4 * 8);
                                   atom->writeField("frame_count", 2 * 8);
                                   atom->writeField<std::string>("compressorname", 32 * 8);
                                   atom->writeField("depth", 2 * 8);
                                   atom->writeField("pre_defined", 2 * 8);
                                   
                                   this->_parseChildAtom(atom);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("pasp", [this](std::shared_ptr<MALAtom> atom) {
                                   uint64_t hSpacing = atom->writeField<uint64_t>("hSpacing", 4 * 8);
                                   uint64_t vSpacing = atom->writeField<uint64_t>("vSpacing", 4 * 8);
                                   if (hSpacing * 1.0 / vSpacing != 1.0) {
                                       malFormatContext_->addShallowWarning("视频存在pasp，sar值不是1，注意渲染");
                                   }
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("hvcC", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   auto parent = atom->parent.lock();
                                   if (parent && parent->name == "ipco") {
                                       auto hvcc = std::make_shared<MALHVCC>();
                                       currentStream_->videoConfig.push_back(hvcc);
                                   }
                                   int64_t lastBytes = atom->dataSource->totalSize() - atom->dataSource->currentBytesPosition();
                                   auto hvcc_datasource = atom->dataSource->readBytesStream(lastBytes,true);
                                   if (currentStream_->video_config_future_.valid()) {
                                       mdp_video_header *header = currentStream_->video_config_future_.get();
                                       if (header) {
                                           currentStream_->video_configs_.push_back(header);
                                       }
                                   }
                                   if (currentStream_) {
                                       currentStream_->video_config_future_ = std::async(std::launch::async, [=,this](){
                                           MALCodecParser codecParser(hvcc_datasource,malFormatContext_, currentStream_, currentStream_->currentConfig());
                                           mdp_video_header *video_config_ =codecParser.parse_hvcc();
                                           return video_config_;
                                       });
                                   }
                                   
//                                   std::vector<MALAtomField> fields = {
//                                       MALAtomField("configurationVersion", 1 * 8),
//                                       MALAtomField("general_profile_space", 2),
//                                       MALAtomField("general_tier_flag", 1),
//                                       MALAtomField("general_profile_idc", 5),
//                                       MALAtomField("general_profile_compatibility_flags", 4 * 8),
//                                       MALAtomField("general_constraint_indicator_flags", 6 * 8),
//                                       MALAtomField("general_level_idc", 1 * 8),
//                                       MALAtomField("reserved", 4),
//                                       MALAtomField("min_spatial_segmentation_idc", 12),
//                                       MALAtomField("reserved", 6),
//                                       MALAtomField("parallelismType", 2),
//                                       MALAtomField("reserved", 6),
//                                       MALAtomField("chroma_format_idc", 2),
//                                       MALAtomField("reserved", 5),
//                                       MALAtomField("bit_depth_luma_minus8", 3),
//                                       MALAtomField("reserved", 5),
//                                       MALAtomField("bit_depth_chroma_minus8", 3),
//                                       MALAtomField("avgFrameRate", 16),
//                                       MALAtomField("constantFrameRate", 2),
//                                       MALAtomField("numTemporalLayers", 3),
//                                       MALAtomField("temporalIdNested", 1),
//                                       MALAtomField("lengthSizeMinusOne", 2,MDPFieldDisplayType_int64,1,[this](fast_any::any any) {
//                                           if (currentStream_) {
//                                               currentStream_->currentConfig()->proto_config.set_length_size_minus_one((int)(*(any.as<uint64_t>())));
//                                           }
//                                           return any;
//                                       }),
//                                   };
//                                   for (auto &el : fields) {
//                                       atom->writeField(el);
//                                   }
                                   
                                   atom->writeField("configurationVersion", 1 * 8);
                                   atom->writeField("general_profile_space", 2);
                                   atom->writeField("general_tier_flag", 1);
                                   atom->writeField("general_profile_idc", 5);
                                   atom->writeField("general_profile_compatibility_flags", 4 * 8);
                                   atom->writeField("general_constraint_indicator_flags", 6 * 8);
                                   atom->writeField("general_level_idc", 1 * 8);
                                   atom->writeField("reserved", 4);
                                   atom->writeField("min_spatial_segmentation_idc", 12);
                                   atom->writeField("reserved", 6);
                                   atom->writeField("parallelismType", 2);
                                   atom->writeField("reserved", 6);
                                   atom->writeField("chroma_format_idc", 2);
                                   atom->writeField("reserved", 5);
                                   atom->writeField("bit_depth_luma_minus8", 3);
                                   atom->writeField("reserved", 5);
                                   atom->writeField("bit_depth_chroma_minus8", 3);
                                   atom->writeField("avgFrameRate", 16);
                                   atom->writeField("constantFrameRate", 2);
                                   atom->writeField("numTemporalLayers", 3);
                                   atom->writeField("temporalIdNested", 1);
                                   auto lengthSizeMinusOne =  atom->writeField("lengthSizeMinusOne", 2);
                                   if (currentStream_) {
                                       currentStream_->currentConfig()->proto_config.set_length_size_minus_one(lengthSizeMinusOne);
                                   }
                                   
    
                                   uint64_t numOfArrays = atom->writeField<uint64_t>("numOfArrays",8);
                                   for(int j = 0; j < numOfArrays; j++) {
                                       atom->writeField("array_completeness",1);
                                       atom->writeField("reserved",1);
                                       atom->writeField("NAL_unit_type",6);
                                       uint64_t numNalus = atom->writeField<uint64_t>("numNalus",2 * 8);
                                       for(int i = 0; i< numNalus; i++) {
                                           uint64_t nalUnitLength = atom->writeField<uint64_t>("nalUnitLength",2 * 8);
                                           //atom->dataSource->seekBytes(nalUnitLength);
                                           atom->writeHexField("nal_data",nalUnitLength * 8);
                                       }
                                   }
                                   
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("ispe", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   uint64_t flags = atom->writeField<uint64_t>("flags", 3 * 8);
                                   atom->writeField("image_width", 4 * 8);
                                   atom->writeField("image_height", 4 * 8);
                               }));
    _parseTableEntry.push_back(
                               std::make_tuple("mfhd", [this](std::shared_ptr<MALAtom> atom) { //对于heif描述了item_id 和 ipco的关系
                                   uint64_t version = atom->writeField<uint64_t>("version", 1 * 8);
                                   uint64_t flags = atom->writeField<uint64_t>("flags", 3 * 8);
                                   atom->writeField("format_flags", 1 * 8);
                                   atom->writeField("pcm_sample_size", 1 * 8);
                               }));
}
bool MP4Parser::supportFormat() {
    if (_datasource->totalSize() < 8)
        return false;
    int64_t pos = _datasource->currentBytesPosition();
    _datasource->seekBytes(4, SEEK_CUR);
    int type = _datasource->readBytesInt64(4);
    _datasource->seekBytes(pos, SEEK_SET);
    if (type == mdp_strconvet_to_int("ftype", 4, 1)) {
        return true;
    }
    
    return false;
}

std::string MP4Parser::dumpVideoConfig() {
//    if (video_config_future_.valid()) {
//        mdp_video_header *header = video_config_future_.get();
//        if (header) {
//            video_configs_.push_back(header);
//        }
//    }
//    cJSON *array = cJSON_CreateArray();
//    for (auto video_config_ : video_configs_) {
//        if (video_config_ && video_config_->root_item) {
//            cJSON *json =  dumpPS_(video_config_->root_item);
//            cJSON_AddItemToArray(array, json);
//        }
//    }
//    char *string = cJSON_Print(array);
//    std::cout << string << std::endl;
//    std::string filename = "/Users/Shared/output_ps.json";
//    // 创建一个输出文件流
//    std::ofstream outputFile(filename);
//    
//    // 检查文件是否成功打开
//    if (!outputFile) {
//        std::cerr << "无法打开文件: " << filename << std::endl;
//        return ""; // 返回错误代码
//    }
//    // 将 JSON 字符串写入文件
//    outputFile << string;
//    
//    // 关闭文件
//    outputFile.close();
//    //    send_async_msg(MDPMessageType_Avc_header,video_config_);
//    return string;
    return "";
}
cJSON * MP4Parser::dumpPS_(mdp_header_item *item) {
    if (!item) return nullptr;
    cJSON *json = cJSON_CreateObject();
    if (item->nb_childs > 0) {
        cJSON *child = cJSON_CreateArray();
        cJSON_AddItemToObject(json, item->cells[0].str_val, child);
        for (int i = 0; i < item->nb_childs; i++) {
            cJSON_AddItemToArray(child, dumpPS_(item->childs[i])) ;
        }
    } else {
        if (item->cells[1].display_type == MDPFieldDisplayType_string) {
            cJSON_AddStringToObject(json, item->cells[0].str_val, item->cells[1].str_val);
        } else {
            cJSON_AddNumberToObject(json, item->cells[0].str_val, item->cells[1].i_val);
        }
    }
    return json;
}
std::string MP4Parser::dumpFormats(int full) {
    return IParser::dumpFormats(full);
}


int MP4Parser::_parseAtom() {
    int ret = 0;
    malFormatContext_->root_atom = std::make_shared<MALAtom>();
    malFormatContext_->root_atom->name = "root";
    malFormatContext_->root_atom->dataSource = _datasource;
    malFormatContext_->root_atom->size = _datasource->totalSize();
    malFormatContext_->root_atom->pos = 0;
    _parseChildAtom(malFormatContext_->root_atom);
    return ret;
}


int MP4Parser::_parseChildAtom(std::shared_ptr<MALAtom> parent, bool once) {
    auto datasource = parent->dataSource;
    while (!datasource->isEof()) {
        if (stop) break;
        std::shared_ptr<MALAtom> atom = std::make_shared<MALAtom>();
        atom->parent = std::weak_ptr<MALAtom>(parent);
        int64_t curPos = datasource->currentBytesPosition();
        atom->pos = curPos + parent->pos;
        atom->size = rbytes_i(4);
        if (atom->size == 0) {
            return 0;
        }
        atom->name = rbytes_s(4);
        if (atom->name == "mdat") {
            int x = 0;
            
        }
        if (curPos + atom->size > datasource->totalSize()) {
            malFormatContext_->addShallowWarning(fmt::format("有超出文件大小的atom:{}",atom->name));
            atom->size = datasource->totalSize() - curPos;
        }
        atom->headerSize = 8;
        if (atom->size == 1) {
            atom->size = rbytes_i(8);
            atom->headerSize += 8;
        }
        int64_t cur = datasource->currentBytesPosition();
        datasource->seekBytes(curPos, SEEK_SET);
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

int MP4Parser::startParse() {
    malFormatContext_->proto_context.set_name("MOV/MP4");
    if (state >= MALParseState::FORMAT_PARSERD) return 0;
    int ret = 0;
    malFormatContext_->priv = std::make_shared<MALMP4FormatPrivData>();
    ret = _parseAtom();
    int index = 0;
    for (auto& stream : malFormatContext_->streams) {
        int index = stream->proto_stream.index();
        pktLoaders[index] = std::make_shared<MALMP4PacketLoader>(malFormatContext_,index);
    }
    state = MALParseState::FORMAT_PARSERD;
    return 0;
}


