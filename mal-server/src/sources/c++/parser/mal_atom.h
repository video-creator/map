#pragma once
#include "mal_idatasource.h"
#include "../datasource/mal_local_datasource.h"
#include <vector>
#include <sstream>
#include <iomanip>
#include <functional>
#include <future>
#include "libyuv.h"
#include "../deps/fast_any/any.h"
#include "../../utils/mal_string.hpp"
#include "../proto_gen/mal.pb.h"
#include "../proto_gen/nal.pb.h"
#include "../proto_gen/mp4.pb.h"
#include "../deps/spdlog/fmt/fmt.h"
#include "json_util.h"
#include <nlohmann/json.hpp>
#include "google/protobuf/message.h"
extern "C" {
#include "../c_ffi/mdp_type_def.h"
#include "libavcodec/avcodec.h"
#include "libavformat/avformat.h"
#include "libavutil/imgutils.h"
#include "../../utils/cJSON.h"
}
namespace mal
{

// 使用 nlohmann/json 作为 JSON 库
using json = nlohmann::json;


// 利用 nlohmann::json，按照 Protobuf 字段定义顺序序列化为 JSON
// 递归处理 Protobuf 消息并转换为 JSON
// 获取字段的默认值
static nlohmann::json GetDefaultValue(const google::protobuf::FieldDescriptor* field) {
    switch (field->cpp_type()) {
        case google::protobuf::FieldDescriptor::CPPTYPE_INT32:
            return field->default_value_int32();
        case google::protobuf::FieldDescriptor::CPPTYPE_INT64:
            return field->default_value_int64();
        case google::protobuf::FieldDescriptor::CPPTYPE_UINT32:
            return field->default_value_uint32();
        case google::protobuf::FieldDescriptor::CPPTYPE_UINT64:
            return field->default_value_uint64();
        case google::protobuf::FieldDescriptor::CPPTYPE_DOUBLE:
            return field->default_value_double();
        case google::protobuf::FieldDescriptor::CPPTYPE_FLOAT:
            return field->default_value_float();
        case google::protobuf::FieldDescriptor::CPPTYPE_BOOL:
            return field->default_value_bool();
        case google::protobuf::FieldDescriptor::CPPTYPE_STRING:
            return field->default_value_string();
        case google::protobuf::FieldDescriptor::CPPTYPE_ENUM:
            return field->default_value_enum()->number();
        default:
            return nullptr; // 消息类型默认值处理为 null
    }
}

// 递归处理 Protobuf 消息并转换为 JSON
static nlohmann::ordered_json MessageToJsonWithFieldOrder(const google::protobuf::Message& message) {
    const google::protobuf::Descriptor* descriptor = message.GetDescriptor();
    const google::protobuf::Reflection* reflection = message.GetReflection();

    nlohmann::ordered_json jsonObj; // 用于存储 JSON 对象

    for (int i = 0; i < descriptor->field_count(); ++i) {
        const google::protobuf::FieldDescriptor* field = descriptor->field(i);

        // 判断字段是否属于 oneof
        if (field->containing_oneof() != nullptr) {
            const google::protobuf::OneofDescriptor* oneof_descriptor = field->containing_oneof();
            const google::protobuf::FieldDescriptor* active_field = reflection->GetOneofFieldDescriptor(message, oneof_descriptor);

            // 如果不是当前活动的 oneof 字段，设置默认值
            if (active_field != field) {
                jsonObj[field->name()] = GetDefaultValue(field);
                continue;
            }
        }

        // 处理 repeated 类型字段
        if (field->is_repeated()) {
            nlohmann::ordered_json jsonArray = nlohmann::ordered_json::array();
            int fieldSize = reflection->FieldSize(message, field);

            for (int j = 0; j < fieldSize; ++j) {
                switch (field->cpp_type()) {
                    case google::protobuf::FieldDescriptor::CPPTYPE_INT32:
                        jsonArray.push_back(reflection->GetRepeatedInt32(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_INT64:
                        jsonArray.push_back(reflection->GetRepeatedInt64(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_UINT32:
                        jsonArray.push_back(reflection->GetRepeatedUInt32(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_UINT64:
                        jsonArray.push_back(reflection->GetRepeatedUInt64(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_DOUBLE:
                        jsonArray.push_back(reflection->GetRepeatedDouble(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_FLOAT:
                        jsonArray.push_back(reflection->GetRepeatedFloat(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_BOOL:
                        jsonArray.push_back(reflection->GetRepeatedBool(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_STRING:
                        jsonArray.push_back(reflection->GetRepeatedString(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_ENUM:
                        jsonArray.push_back(reflection->GetRepeatedEnumValue(message, field, j));
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_MESSAGE: {
                        const google::protobuf::Message& subMessage = reflection->GetRepeatedMessage(message, field, j);
                        jsonArray.push_back(MessageToJsonWithFieldOrder(subMessage)); // 递归处理嵌套的 Message
                        break;
                    }
                    default:
                        break; // 其他类型这里不处理
                }
            }
            jsonObj[field->name()] = jsonArray;

        } else {
            // 处理非 repeated 类型字段
            if (reflection->HasField(message, field)) {
                switch (field->cpp_type()) {
                    case google::protobuf::FieldDescriptor::CPPTYPE_INT32:
                        jsonObj[field->name()] = reflection->GetInt32(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_INT64:
                        jsonObj[field->name()] = reflection->GetInt64(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_UINT32:
                        jsonObj[field->name()] = reflection->GetUInt32(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_UINT64:
                        jsonObj[field->name()] = reflection->GetUInt64(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_DOUBLE:
                        jsonObj[field->name()] = reflection->GetDouble(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_FLOAT:
                        jsonObj[field->name()] = reflection->GetFloat(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_BOOL:
                        jsonObj[field->name()] = reflection->GetBool(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_STRING:
                        jsonObj[field->name()] = reflection->GetString(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_ENUM:
                        jsonObj[field->name()] = reflection->GetEnumValue(message, field);
                        break;
                    case google::protobuf::FieldDescriptor::CPPTYPE_MESSAGE: {
                        const google::protobuf::Message& subMessage = reflection->GetMessage(message, field);
                        jsonObj[field->name()] = MessageToJsonWithFieldOrder(subMessage); // 递归处理嵌套的 Message
                        break;
                    }
                    default:
                        break; // 其他类型这里不处理
                }
            } else {
                // 未设置的字段使用默认值
                jsonObj[field->name()] = GetDefaultValue(field);
            }
        }
    }

    return jsonObj;
}

// Function to flatten JSON object into a vector, supporting exclude keys (with unordered_set)
static void flatten_json(const nlohmann::ordered_json& j, std::vector<std::pair<std::string, std::string>>& result, const std::function<bool(const std::string&, const json&)>& filter_callback) {
    // 递归遍历 JSON 对象
    for (auto it = j.begin(); it != j.end(); ++it) {
        const std::string& key = it.key();

        // 检查当前 key 是否在 exclude_keys 哈希表中
        if (filter_callback && !filter_callback(key, *it)) {
            continue; // 如果回调返回false，该键值对跳过
        }

        // 根据值的类型处理
        if (it->is_primitive()) { // 如果是基本类型（数字、字符串、布尔值等）
            result.emplace_back(key, it->dump()); // 加入结果，serialize 值为字符串
        } else if (it->is_object()) { // 如果是子对象，递归处理
            flatten_json(*it, result, filter_callback);
        } else if (it->is_array()) { // 如果是数组，遍历所有元素并处理
            for (const auto& el : *it) {
                if (el.is_primitive()) {
                    result.emplace_back(key, el.dump());
                } else {
                    flatten_json(el, result, filter_callback);
                }
            }
        }
    }
}
static google::protobuf::util::JsonPrintOptions jsonOptions() {
    google::protobuf::util::JsonPrintOptions options;
//        options.add_whitespace = true;                // 可选：使输出更具可读性（换行、缩进等）
    options.always_print_fields_with_no_presence = true; // 打印默认值的字段
    options.preserve_proto_field_names = true; //原始字段名打印
    return options;
}
static std::vector<std::pair<std::string, std::string>> flattenBean(const google::protobuf::Message& message, const std::function<bool(const std::string&, const json&)>& filter_callback = nullptr) {
    std::string jsonOutput;
//    auto  status = google::protobuf::util::MessageToJsonString(message, &jsonOutput, jsonOptions());
//    json j = json::parse(jsonOutput);
    nlohmann::ordered_json j = MessageToJsonWithFieldOrder(message);
//    auto a = j.dump(4);
        // 用于存放平铺的结果，使用 std::pair 来存储 key-value
    std::vector<std::pair<std::string, std::string>> flattened_result;
        // 调用函数，排除 "age" 和 "email" keys
    flatten_json(j, flattened_result, filter_callback);
    return flattened_result;
}
class MALAVCSlice {
public:
    virtual ~MALAVCSlice() {
        
    }
};

static mal::proto::MALAtomField  createAtomField(const std::string &name, const std::string &value) {
    mal::proto::MALAtomField field;
    field.set_name(name);
    field.set_value(value);
    return field;
}
#define STR(val) std::to_string((val))
class MALNalBase {
public:
    mal::proto::MALAVCNal * avcnal = nullptr;
    mal::proto::MALHEVCNal * hevcnal = nullptr;

    virtual cJSON * dumpJson() {
        cJSON *json = cJSON_CreateObject();
        return json;
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
       
    }
    virtual void getDisplayFields(mal::proto::MALPacketNal *base, const google::protobuf::Message& message, const std::function<bool(const std::string&, const json&)>& filter_callback = nullptr) {
        auto flattened_result = flattenBean(message,filter_callback);
        for (auto& el : flattened_result) {
            auto key = std::get<0>(el);
            auto val = std::get<1>(el);
            base->mutable_display_fields()->Add(createAtomField(key, val));
        }
    }
};
class MALNal: public MALNalBase{
public:
    //    int nal_unit_type = 0;
    proto::MALNal base_nal;
    virtual ~MALNal() {
        
    }
    virtual cJSON * dumpJson() {
        cJSON *json = cJSON_CreateObject();
        cJSON_AddNumberToObject(json, "nal_unit_type", base_nal.nal_unit_type());
        return json;
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        getDisplayFields(pkt_nal, base_nal);
    }
};


class MALAVCNal : public MALNalBase{
public:
    mal::proto::MALAVCNal proto_nal;
    MALAVCNal() {
        avcnal = &proto_nal;
    }
    std::vector<std::shared_ptr<MALAVCSlice>> slices;
    virtual ~MALAVCNal() {
        
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_avc_nal()->CopyFrom(proto_nal);
        getDisplayFields(pkt_nal, proto_nal);
    }
};
class MALAVCSPS : public MALNalBase{ //nal_unit_type 7
public:
    mal::proto::MALAVCSPS proto_sps;
    MALAVCSPS() {
        avcnal = proto_sps.mutable_base();
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_avc_sps()->CopyFrom(proto_sps);
        getDisplayFields(pkt_nal, proto_sps);
    }
};
class MALAVCPPS : public MALNalBase{ //nal_unit_type 8
public:
    mal::proto::MALAVCPPS proto_pps;
    MALAVCPPS() {
        avcnal = proto_pps.mutable_base();
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_avc_pps()->CopyFrom(proto_pps);
        getDisplayFields(pkt_nal, proto_pps);
    }
};

class MALAVCSliceWithOutPartitioning : public MALNalBase{ //nal_unit_type 1/5
public:
    mal::proto::MALAVCSliceWithOutPartitioning rbsp_nal;
    MALAVCSliceWithOutPartitioning() {
        avcnal = rbsp_nal.mutable_base();
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_avc_out_rbsp()->CopyFrom(rbsp_nal);
        getDisplayFields(pkt_nal, rbsp_nal);
    }
};
class MALAVCSlicePartitionA : public MALNalBase{ //nal_unit_type 2
public:
    mal::proto::MALAVCSlicePartitionA rbsp_nal;
    MALAVCSlicePartitionA() {
        avcnal = rbsp_nal.mutable_base();
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_avc_part_a_rbsp()->CopyFrom(rbsp_nal);
        getDisplayFields(pkt_nal, rbsp_nal);
    }
};
class MALAVCSlicePartitionB : public MALNalBase{ //nal_unit_type 3
public:
    mal::proto::MALAVCSlicePartitionA rbsp_nal;
    MALAVCSlicePartitionB() {
        avcnal = rbsp_nal.mutable_base();
    }
};
class MALAVCSlicePartitionC : public MALNalBase{ //nal_unit_type 4
public:
    mal::proto::MALAVCSlicePartitionA rbsp_nal;
    MALAVCSlicePartitionC() {
        avcnal = rbsp_nal.mutable_base();
    }
};

// class MALSEIMessage {
// public:
//     std::string key;
//     int payloadType;
//     std::string value;
//     int payloadSize;
// };

class MALAVCSEI : public MALNalBase{ //nal_unit_type 6
public:
    mal::proto::MALAVCSEI proto_sei;
    MALAVCSEI() {
        avcnal = proto_sei.mutable_base();
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_avc_sei()->CopyFrom(proto_sei);
        getDisplayFields(pkt_nal, proto_sei, [](const std::string& key, const json& value)->bool {
            std::string x = value.dump();
            if (key == "key" && value == "") {
                return false;
            }
            if (key == "key_hex" && value == "") {
                return false;
            }
            if (key == "value" && value == "") {
                return false;
            }
            if (key == "value_hex" && value == "") {
                return false;
            }
            return true;
        });
    }
};



class MALCheck {
public:
    std::vector<std::string> warning;
    std::vector<std::string> errors;
};
class MALShallowCheck: public MALCheck {
    
};
class MALDeepCheck: public MALCheck {
    
};
class MALVideoConfig {
public:
    mal::proto::MALVideoConfig proto_config;
    virtual ~MALVideoConfig() {
        
    }
};
class MALAVCC: public MALVideoConfig {
public:
    proto::MALAVCC proto_config;
    std::vector<std::shared_ptr<MALAVCSPS>> spsList;
    std::vector<std::shared_ptr<MALAVCPPS>> ppsList;
    std::vector<std::shared_ptr<MALAVCSEI>> seiList;
};

enum  MALHEVCNALTYPE {
    TRAIL_N = 0,
    TRAIL_R = 1,
    
    TSA_N = 2,
    TSA_R = 3,
    
    STSA_N = 4,
    STSA_R = 5,
    
    RADL_N = 6,
    RADL_R = 7,
    
    RASL_N = 8,
    RASL_R = 9,
    
    RSV_VCL_N10 = 10,
    RSV_VCL_N12 = 12,
    RSV_VCL_N14 = 14,
    
    RSV_VCL_R11 = 11,
    RSV_VCL_R13 = 13,
    RSV_VCL_R15 = 15,
    
    BLA_W_LP = 16,
    BLA_W_RADL = 17,
    BLA_N_LP = 18,
    
    IDR_W_RADL = 19,
    IDR_N_LP = 20,
    
    CRA_NUT = 21,
    
    RSV_IRAP_VCL22 = 22,
    RSV_IRAP_VCL23 = 23,
    RSV_VCL24 = 24,
    RSV_VCL25 = 25,
    RSV_VCL26 = 26,
    RSV_VCL27 = 27,
    RSV_VCL28 = 28,
    RSV_VCL29 = 29,
    RSV_VCL30 = 30,
    RSV_VCL31 = 31,
    
    VPS_NUT = 32,
    
    SPS_NUT = 33,
    
    PPS_NUT = 34,
    
    AUD_NUT = 35,
    
    EOS_NUT = 36,
    
    EOB_NUT = 37,
    
    FD_NUT = 38,
    
    PREFIX_SEI_NUT = 39,
    SUFFIX_SEI_NUT = 40
};
class MALHEVCNal : public MALNalBase{
public:
    mal::proto::MALHEVCNal proto_nal;
    MALHEVCNal() {
        hevcnal = &proto_nal;
    }
    std::vector<std::shared_ptr<MALAVCSlice>> slices;
    virtual ~MALHEVCNal() {
        
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_hevc_nal()->CopyFrom(proto_nal);
        getDisplayFields(pkt_nal, proto_nal);
    }
  
};

class MALHEVCSliceSegmentLayerRbsp : public MALNalBase{
public:
    mal::proto::MALHEVCSliceSegmentLayerRbsp rbsp_nal;
    MALHEVCSliceSegmentLayerRbsp() {
        hevcnal = rbsp_nal.mutable_base();
    }
    cJSON * dumpJson() {
        cJSON *json = MALNalBase::dumpJson();
        cJSON_AddNumberToObject(json, "slice_type", rbsp_nal.header().slice_type());
        cJSON_AddNumberToObject(json, "slice_pic_parameter_set_id", rbsp_nal.header().slice_pic_parameter_set_id());
        return json;
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_hevc_rbsp()->CopyFrom(rbsp_nal);
        getDisplayFields(pkt_nal, rbsp_nal);
    }
    
};
class MALHEVCVPS : public MALNalBase{
public:
    mal::proto::MALHEVCVPS proto_vps;
    MALHEVCVPS() {
        hevcnal = proto_vps.mutable_base();
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_hevc_vps()->CopyFrom(proto_vps);
        getDisplayFields(pkt_nal, proto_vps);
    }
};

typedef struct MediaH265RawProfileTierLevel {
    uint8_t general_profile_space;
    uint8_t general_tier_flag;
    uint8_t general_profile_idc;
    
    uint8_t general_profile_compatibility_flag[32];
    
    uint8_t general_progressive_source_flag;
    uint8_t general_interlaced_source_flag;
    uint8_t general_non_packed_constraint_flag;
    uint8_t general_frame_only_constraint_flag;
    
    uint8_t general_max_12bit_constraint_flag;
    uint8_t general_max_10bit_constraint_flag;
    uint8_t general_max_8bit_constraint_flag;
    uint8_t general_max_422chroma_constraint_flag;
    uint8_t general_max_420chroma_constraint_flag;
    uint8_t general_max_monochrome_constraint_flag;
    uint8_t general_intra_constraint_flag;
    uint8_t general_one_picture_only_constraint_flag;
    uint8_t general_lower_bit_rate_constraint_flag;
    uint8_t general_max_14bit_constraint_flag;
    
    uint8_t general_inbld_flag;
    
    uint8_t general_level_idc;
    
    
} MediaH265RawProfileTierLevel;

class MALHEVCSPS : public MALNalBase{
public:
    mal::proto::MALHEVCSPS proto_sps;
    MALHEVCSPS(){
        hevcnal = proto_sps.mutable_base();
    }
    cJSON * dumpJson() {
        cJSON *json = MALNalBase::dumpJson();
        cJSON_AddNumberToObject(json, "seq_parameter_set_id", proto_sps.seq_parameter_set_id());
        return json;
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_hevc_sps()->CopyFrom(proto_sps);
        getDisplayFields(pkt_nal, proto_sps);
    }
    MediaH265RawProfileTierLevel profile_tier;
};
class MALHEVCPPS : public MALNalBase{ //nal_unit_type 8
public:
    mal::proto::MALHEVCPPS proto_pps;
    MALHEVCPPS() {
        hevcnal = proto_pps.mutable_base();
    }
    cJSON * dumpJson() {
        cJSON *json = MALNalBase::dumpJson();
        cJSON_AddNumberToObject(json, "seq_parameter_set_id", proto_pps.seq_parameter_set_id());
        cJSON_AddNumberToObject(json, "pic_parameter_set_id", proto_pps.pic_parameter_set_id());
        return json;
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_hevc_pps()->CopyFrom(proto_pps);
        getDisplayFields(pkt_nal, proto_pps);
    }
};
class MALHEVCSEI : public MALNalBase{ //nal_unit_type 6
public:
    // std::vector<MALSEIMessage> messageList;
    mal::proto::MALHEVCSEI proto_sei;
    MALHEVCSEI() {
        hevcnal = proto_sei.mutable_base();
    }
    virtual void convert2ProtoNal(proto::MALPacketNal *pkt_nal) {
        pkt_nal->mutable_hevc_sei()->CopyFrom(proto_sei);
        std::unordered_set<std::string> exclude_keys = {};
        getDisplayFields(pkt_nal, proto_sei,[](const std::string& key, const json& value) -> bool {
            std::string x = value.dump();
            if (key == "key" && value == "") {
                return false;
            } 
            if (key == "key_hex" && value == "") {
                return false;
            }
            if (key == "value" && value == "") {
                return false;
            }
            if (key == "value_hex" && value == "") {
                return false;
            }
            return true;
        });
    }
};

class MALHVCC: public MALVideoConfig {
public:
    mal::proto::MALHVCC proto_hvcc;
    std::vector<std::shared_ptr<MALHEVCVPS>> vpsList;
    std::vector<std::shared_ptr<MALHEVCSPS>> spsList;
    std::vector<std::shared_ptr<MALHEVCPPS>> ppsList;
    std::vector<std::shared_ptr<MALHEVCSEI>> seiList;
};

static void release_video_config_item(mdp_header_item *item) {
    if (!item) return;
    for (int i = 0; i < item->nb_childs; i++) {
        release_video_config_item(item->childs[i]);
    }
    free(item->cells);
    free(item);
}

class MALStream {
public:
    mal::proto::MALStream proto_stream;
    std::vector<mdp_video_header *> video_configs_;
    std::future<mdp_video_header *> video_config_future_;
    
    AVCodecContext *dec_ctx;
    
    virtual void convert2ProtoStream(proto::MALStream* dst) {
        if (video_config_future_.valid()) {
            mdp_video_header *header = video_config_future_.get();
            if (header) {
                video_configs_.push_back(header);
            }
        }
        proto_stream.mutable_video_stream()->clear_ps_items();
        for (auto video_config_ : video_configs_) {
            if (video_config_ && video_config_->root_item) {
                auto ps_item = proto_stream.mutable_video_stream()->add_ps_items();
                convert2PSItem(video_config_->root_item, ps_item);
            }
        }
        if (proto_stream.has_video_stream()) { //video
            proto_stream.mutable_video_stream()->clear_display_items();
            if (proto_stream.video_codec() == proto::MAL_VIDEO_CODEC_H264) {
                proto_stream.set_codec_name("H264");
            } else if (proto_stream.video_codec() == proto::MAL_VIDEO_CODEC_H265) {
                proto_stream.set_codec_name("H265");
            } else if (proto_stream.video_codec() == proto::MAL_VIDEO_CODEC_PNG) {
                proto_stream.set_codec_name("PNG");
            }
            auto result = flattenBean(proto_stream.video_stream(),[=](const std::string& key, const json& value)->bool {
                if (key == "video_configs" || key == "ps_items" || key == "display_items") {
                    return false;
                }
                return true;
            });
            for (auto pair : result) {
                auto item = proto_stream.mutable_video_stream()->add_display_items();
                auto cell = item->add_cells();
                cell->set_val(std::get<0>(pair));
                cell->set_enable(true);
                cell = item->add_cells();
                cell->set_enable(true);
                cell->set_val(std::get<1>(pair));
            }
        }
        dst->CopyFrom(proto_stream);
    }
    std::vector<std::shared_ptr<MALVideoConfig>> videoConfig = {};
    std::shared_ptr<MALVideoConfig> currentConfig() {
        if (videoConfig.empty()) return nullptr;
        return videoConfig[videoConfig.size() - 1];
    }
    virtual ~MALStream() {
        if (dec_ctx) {
            avcodec_free_context(&dec_ctx);
        }
        for (mdp_video_header *header : video_configs_) {
            if (!header) continue;
            if (header->root_item) {
                release_video_config_item(header->root_item);
            }
            header->root_item = NULL;
            free(header);
        }
        video_configs_.clear();
    }
private:
    void convert2PSItem(mdp_header_item *item, mal::proto::MALPSItem *proto_item) {
        for (int i = 0; i < item->nb_cells; i++) {
            auto proto_cell = proto_item->add_cells();
            auto cell = item->cells[i];
            proto_cell->set_enable(cell.enable);
            if (cell.display_type == MDPFieldDisplayType_string) {
                proto_cell->set_val(cell.str_val);
            } else {
                proto_cell->set_val(std::to_string(cell.i_val));
            }
        }
        for (int i = 0; i < item->nb_childs; i++) {
            auto child = item->childs[i];
            auto proto_child = proto_item->add_childs();
            convert2PSItem(child, proto_child);
        }
    }
};
class MALFormatPrivData {
public:
    virtual ~MALFormatPrivData() {
        
    }
};


class MALMP4FormatPrivData:public MALFormatPrivData{
public:
    proto::MALMP4Mvhd mvhd;
};
class MALFrame {
public:
    proto::MALFrame proto_frame;
    void convert2ProtoFrame(proto::MALFrame *frame) {
        frame->CopyFrom(proto_frame);
    }
    void set_ff_frame(AVFrame *ff_frame, AVMediaType mediaType) {
        ff_frame_ = ff_frame;
        media_type_ = mediaType;
        if (mediaType == AVMEDIA_TYPE_VIDEO) {
            proto_frame.mutable_video_frame()->set_width(ff_frame->width);
            proto_frame.mutable_video_frame()->set_height(ff_frame->height);
            proto_frame.set_pkt_pos(ff_frame->pkt_pos);
            if (ff_frame->format == AV_PIX_FMT_YUV420P) {
                proto_frame.mutable_video_frame()->set_pixel_format(::mal::proto::MALVideoPixelFormat::YUV420P);
            } else if (ff_frame->format == AV_PIX_FMT_YUV420P10LE) {
                proto_frame.mutable_video_frame()->set_pixel_format(::mal::proto::MALVideoPixelFormat::YUV420P10LE);
            } else if (ff_frame->format == AV_PIX_FMT_RGBA) {
                proto_frame.mutable_video_frame()->set_pixel_format(::mal::proto::MALVideoPixelFormat::RGBA);
            } else if (ff_frame->format == AV_PIX_FMT_YUVJ420P) {
                proto_frame.mutable_video_frame()->set_pixel_format(::mal::proto::MALVideoPixelFormat::YUVJ420P);
            }
        }
    }
    void get_detail_info() {
        if (media_type_ == AVMEDIA_TYPE_VIDEO) {
            if (proto_frame.video_frame().rgb_data().length() == 0) {
//                yuv_to_rgba();
                int size = av_image_get_buffer_size((AVPixelFormat)ff_frame_->format, ff_frame_->width, ff_frame_->height, 1);
                uint8_t *dst = (uint8_t*)malloc(size);

                if (dst) {
                    // 2. 一键拷贝所有分量到连续内存 dst 中
                    // 这里的 align 填 1 表示按 1 字节对齐（即紧凑排列）
                    av_image_copy_to_buffer(dst, size,
                                            (const uint8_t * const *)ff_frame_->data,
                                            ff_frame_->linesize,
                                            (AVPixelFormat)ff_frame_->format,
                                             ff_frame_->width,
                                            ff_frame_->height,
                                            1);
                    proto_frame.mutable_video_frame()->set_frame_data(reinterpret_cast<const char*>(dst),size);
                    free(dst);
                }
            }
        }
    }
    ~MALFrame() {
        if (ff_frame_) {
            av_frame_free(&ff_frame_);
        }
    }
private:
    AVFrame *ff_frame_ = nullptr;
    AVMediaType media_type_ = AVMEDIA_TYPE_UNKNOWN;
    void yuv_to_rgba() {
        if (!ff_frame_) {
            return;
        }
        int width = ff_frame_->width;
        int height = ff_frame_->height;
        size_t size = width * height * 4;
        uint8_t *dst = (uint8_t*)malloc(size);
        int src_stride[4] = {0};
        int dst_stride[1] = {0};
        dst_stride[0] = width * 4;
        src_stride[0] = ff_frame_->linesize[0];
        src_stride[1] = ff_frame_->linesize[1];
        src_stride[2] = ff_frame_->linesize[2];
        src_stride[3] = ff_frame_->linesize[3];
        if (ff_frame_->format == AV_PIX_FMT_YUV420P || ff_frame_->format == AV_PIX_FMT_YUVJ420P) { //AV_PIX_FMT_YUVj420P色彩不对，暂时先显示
            libyuv::I420ToABGR(ff_frame_->data[0], src_stride[0], ff_frame_->data[1],
                               src_stride[1], ff_frame_->data[2], src_stride[2],
                               dst, dst_stride[0], width, height);
        } else if(ff_frame_->format == AV_PIX_FMT_YUVA420P) {
            libyuv::I420AlphaToABGR(ff_frame_->data[0], src_stride[0], ff_frame_->data[1],
                                    src_stride[1], ff_frame_->data[2], src_stride[2],
                                    ff_frame_->data[3], src_stride[3], dst,
                                    dst_stride[0], width, height, 1);
        }
        
        proto_frame.mutable_video_frame()->set_rgb_data(reinterpret_cast<const char*>(dst), size);
        free(dst);
    }
};

class MALMP4Stream: public MALStream {
public:
    std::vector<int64_t> stss; //关键帧
    std::vector<std::tuple<int64_t,int64_t,int64_t>> stsc; //first_chunk,samples_per_chunk,sample_description_index
    std::vector<int64_t> stsz; //每帧大小size
    std::vector<int64_t> stco; //每个chunk offset 存放每个chunck相对于文件的位置
    std::vector<std::tuple<int64_t,int64_t>> stts;//dts
    std::vector<std::tuple<int64_t,int64_t>> ctts;//dts
    std::vector<std::tuple<int64_t,int64_t,int64_t,int64_t>> elst;//elst
    proto::MALMP4Mdhd mdhd;
    proto::MALMP4Tkhd tkhd;

    
    ~MALMP4Stream() {
        
    }
private:
   
};




inline std::string mal_convert_pkt_flag_to_str(proto::MALPacketFlag flag) {
    if (flag == proto::MAL_PACKET_FLAG_NONE) {
        return "unknown";
    } else if (flag == proto::MAL_PACKET_FLAG_IDR) {
        return "IDR";
    } else if (flag == proto::MAL_PACKET_FLAG_I) {
        return "I";
    } else if (flag == proto::MAL_PACKET_FLAG_P) {
        return "P";
    } else if (flag == proto::MAL_PACKET_FLAG_B) {
        return "B";
    }
    return "unknown";
}

class MALPacket {
public:
    explicit MALPacket(AVPacket *pkt): pkt_(pkt) {
        
    }
    explicit MALPacket(uint8_t *data, uint64_t size): data_(data),size_(size) {
        datasource = std::make_shared<LocalDataSource>(data,size);
        datasource->open();
        proto_packet.set_size(size);
    }
    mal::proto::MALPacket proto_packet;
    void convert2ProtoPakcet(mal::proto::MALPacket *proto_pkt) {
        proto_pkt->CopyFrom(proto_packet);
        for (auto nal : nals) {
//            std::string a = nal->base_nal.nal_name();
            auto proto_nal = proto_pkt->add_nals();
            nal->convert2ProtoNal(proto_nal);
        }
    }
    std::vector<std::shared_ptr<MALNalBase>> nals;
    uint8_t *data() {
        return pkt_ == NULL ? data_ : pkt_->data;
    }
    int64_t size() {
        return pkt_ == NULL ? proto_packet.size() : pkt_->size;
    }
    mdp_video_header *nal_header = nullptr;
    int avc_PicOrderCntMsb = 0;
    int avc_PicOrderCntLsb = 0;
    int avc_TopFieldOrderCnt = 0;
    int avc_BottomFieldOrderCnt = 0;
    int avc_FrameNumOffset = 0;
    int avc_IdrPicFlag = 0;
    std::shared_ptr<IDataSource> datasource = nullptr;
    //    int POC = 0;
    mal::proto::MALAVCSliceHeader *sliceHeader = nullptr;
    std::string dumpSampleJson() {
        cJSON *json = cJSON_CreateObject();
        cJSON_AddNumberToObject(json, "index", proto_packet.number());
        cJSON_AddNumberToObject(json, "pos", proto_packet.pos());
        cJSON_AddNumberToObject(json, "size", size());
        cJSON_AddNumberToObject(json, "poc", proto_packet.poc());
        cJSON_AddNumberToObject(json, "pts", proto_packet.pts());
        cJSON_AddNumberToObject(json, "pts_time", proto_packet.pts_time());
        cJSON_AddNumberToObject(json, "dts", proto_packet.dts());
        cJSON_AddStringToObject(json, "flags", mal_convert_pkt_flag_to_str(proto_packet.flag()).c_str());
        cJSON * nals_dec = cJSON_CreateArray();
        cJSON_AddItemToObject(json, "nals", nals_dec);
        for (int i = 0; i < nals.size(); i++) {
            auto nal = nals[i];
            std::string name = "nal[" + std::to_string(i) + "]";
            cJSON_AddItemToObject(nals_dec,name.c_str() , nal->dumpJson());
        }
        return cJSON_Print(json);
    }
    ~MALPacket() {
        av_packet_free(&pkt_);
        if (nal_header) {
            release_video_config_item(nal_header->root_item);
            free(nal_header);
            nal_header = nullptr;
        }
    }
private:
    AVPacket *pkt_ = nullptr;
    uint8_t *data_ = nullptr;
    int64_t size_ = 0;
};
class MALAtomField {
public:
    mal::proto::MALAtomField proto_field;
//    MALAtomField() {}
//    MALAtomField(std::string _name,int64_t _pos, int _bits, std::string _extraVal="") {
//        name = _name;
//        pos = _pos;
//        bits = _bits;
//        extraVal = _extraVal;
//    }
//    MALAtomField(std::string _name, int _bits, MDPFieldDisplayType type = MDPFieldDisplayType_int64 , int _big =1, std::function<fast_any::any(fast_any::any)> _callback = NULL) {
//        name = _name;
//        bits = _bits;
//        display_type = type;
//        callback = _callback;
//        big = _big;
//    }
//   
//    std::string name;
//    std::string extraVal;
//    int64_t pos;
//    int bits;
//    MDPFieldDisplayType display_type = MDPFieldDisplayType_int64; //显示int
//    std::function<fast_any::any(fast_any::any)> callback;
//    int big = 1;
//    std::string strVal = "";
};

class MALAtom {
public:
    mal::proto::MALAtom proto_atom;
    bool drop = false;
    void convert2ProtoAtom(proto::MALAtom *dst) {
        dst->CopyFrom(proto_atom);
        dst->set_name(name);
        dst->set_pos(pos);;
        dst->set_size(size);
        dst->set_header_size(headerSize);
        dst->clear_child_boxes();
        for (int i = 0; i < childBoxs.size(); i++) {
            auto child = childBoxs[i];
            auto child_proto = dst->add_child_boxes();
            child->convert2ProtoAtom(child_proto);
        }
        dst->clear_fields();
        for (int i = 0; i < fields.size(); i++) {
            auto field = fields[i];
            if (!field) continue;
            auto field_proto = dst->add_fields();
            field_proto->CopyFrom(field->proto_field);
//            field_proto->set_name(field->name);
//            field_proto->set_pos(field->pos);
//            field_proto->set_bits(field->bits);
//            field_proto->set_big(field->big);
//            field_proto->set_extra_val(field->extraVal);
//            if (field->display_type == MDPFieldDisplayType_int64) {
//                field_proto->set_value(std::to_string(*(field->val.as<uint64_t>())));
//            } else if (field->display_type ==
//                       MDPFieldDisplayType_string &&
//                       field->val.has_value()) {
//                field_proto->set_value(*(field->val.as<std::string>()));
//            } else if (field->display_type ==
//                       MDPFieldDisplayType_double &&
//                       field->val.has_value()) {
//                field_proto->set_value(std::to_string(*(field->val.as<double>())));
//            }
        }
    }
    std::string name = "";
    int64_t pos = 0;
    int64_t size = 0;
    int headerSize = 0;
    std::shared_ptr<IDataSource> dataSource;
    std::vector<std::shared_ptr<MALAtom>> childBoxs;
    std::vector<std::shared_ptr<MALAtomField>> fields;
    std::weak_ptr<MALAtom> parent;
    
    bool isNumber(mal::proto::MDPFieldDisplayType type) {
        if (type == mal::proto::MDPFieldDisplayType::double_
            || type == mal::proto::MDPFieldDisplayType::uint32
            || type == mal::proto::MDPFieldDisplayType::uint64
            || type == mal::proto::MDPFieldDisplayType::int32
            ||type == mal::proto::MDPFieldDisplayType::int64) {
            return true;
        }
        return false;
    }
    template <typename T = uint64_t>
    std::shared_ptr<MALAtomField> writeValueField(std::string _name, T val, std::string _extraVal="", int64_t pos = -1, int64_t bits= -1, int big = 0) {
        auto field = std::make_shared<MALAtomField>();
        mal::proto::MDPFieldDisplayType type;
        std::string strval = "";
        if constexpr(std::is_same<T,int32_t>::value){
            type = mal::proto::MDPFieldDisplayType::int32;
            field->proto_field.set_i32(val);
            strval = std::to_string(val);
        } else if constexpr(std::is_same<T,uint32_t>::value){
            type = mal::proto::MDPFieldDisplayType::uint32;
            field->proto_field.set_ui32(val);
            strval = std::to_string(val);
        } else if constexpr(std::is_same<T,int64_t>::value){
            type = mal::proto::MDPFieldDisplayType::int64;
            field->proto_field.set_i64(val);
            strval = std::to_string(val);
        } else if constexpr(std::is_same<T,uint64_t>::value){
            type = mal::proto::MDPFieldDisplayType::uint64;
            field->proto_field.set_ui64(val);
            strval = std::to_string(val);
        } else if constexpr(std::is_same<T,double>::value){
            type = mal::proto::MDPFieldDisplayType::double_;
            field->proto_field.set_db(val);
            strval = std::to_string(val);
        } else if constexpr(std::is_same<T,std::string>::value || std::is_same<T, const char*>::value){
            type = mal::proto::MDPFieldDisplayType::string;
            field->proto_field.set_strv(val);
            strval = val;
        }
        field->proto_field.set_name(_name);
        field->proto_field.set_type(type);
        field->proto_field.set_pos(pos);
        field->proto_field.set_bits(bits);
        field->proto_field.set_big(big);
        field->proto_field.set_extra_val(_extraVal);
        field->proto_field.set_value(strval);
        fields.push_back(field);
        return field;
    }
    template <typename T = uint64_t>
    T writeField(std::string _name, int64_t _bits,int big = 1, std::string _extraVal="",std::function<T(T)> callback = NULL) {
        if (_bits > 0) {
            _name = _name + "(" + std::to_string(_bits) + "bits" + ")";
        }
        if constexpr(std::is_same<T,int32_t>::value
                     || std::is_same<T,uint32_t>::value
                     || std::is_same<T,int64_t>::value
                     || std::is_same<T,uint64_t>::value){
            uint64_t val = dataSource->readBitsInt64(_bits,0, big);
            if (callback) {
                T v = callback((T)val);
                writeValueField<T>(_name, v,_extraVal,dataSource->currentBitsPosition(),_bits,big);
            } else {
                writeValueField<T>(_name, (T)val,_extraVal,dataSource->currentBitsPosition(),_bits,big);
            }
            return (T)val;
        } else if constexpr(std::is_same<T,double>::value){
            uint64_t val = dataSource->readBitsInt64(_bits,0, big);
            double dval = 0;
            union tmp {
                int64_t a;
                double b;
            };
            union tmp t;
            t.a = val;
            dval = t.b;
            writeValueField<double>(_name, dval,"",dataSource->currentBitsPosition(),_bits,big);
            return dval;
        } else if constexpr(std::is_same<T,std::string>::value || std::is_same<T, const char*>::value){
            std::string val = dataSource->readBytesString(_bits/8);
            writeValueField<std::string>(_name, val,"",dataSource->currentBitsPosition(),_bits,big);
            return val;
        }
        return (T)0;
    }
    
//    else if constexpr(std::is_same<T,uint32_t>::value){
//        uint64_t val = dataSource->readBitsInt64(_bits,0, big);
//        writeValueField<uint32_t>(_name, (uint32_t)val,"",dataSource->currentBitsPosition(),_bits,big);
//        return (T)val;
//    } else if constexpr(std::is_same<T,int64_t>::value){
//        uint64_t val = dataSource->readBitsInt64(_bits,0, big);
//        writeValueField<T>(_name, (int64_t)val,"",dataSource->currentBitsPosition(),_bits,big);
//        return (T)val;
//    } else if constexpr(std::is_same<T,uint64_t>::value){
//        uint64_t val = dataSource->readBitsInt64(_bits,0, big);
//        writeValueField<uint64_t>(_name, val,"",dataSource->currentBitsPosition(),_bits,big);
//        return (T)val;
//    }
    std::string writeHexField(std::string _name, int64_t _bits,int big = 1, std::string _extraVal="", int64_t directVal = 0) {
        if (_bits > 0) {
            _name = _name + "(" + std::to_string(_bits) + "bits" + ")";
        }
        int bytes = _bits/8;
        std::string val = "0x";
        if (_bits > 0) {
            for (size_t i = 0; i < bytes; i++) {
                val += mal_int_to_hex_string(dataSource->readBytesInt64(1)) + " ";
            }
        } else if (directVal >= 0) {
            val += fmt::format("{:x}", directVal);
        }
        writeValueField<std::string>(_name, val,_extraVal,dataSource->currentBitsPosition(),_bits,big);
        return val;
    }
    std::string writeHexDirectValField(std::string _name, int64_t directVal, std::string _extraVal="") {
        return writeHexField(_name, -1, 1, _extraVal, directVal);
    }
    double writeFix16X16PointField(std::string _name, int64_t _bits,int big = 1, std::string _extraVal="") {
        if (_bits > 0) {
            _name = _name + "(" + std::to_string(_bits) + "bits" + ")";
        }
        unsigned char *data = dataSource->readBytesRaw(_bits/8);
        double val = mdp_strconvet_to_fixed_16x16_point((char *)data);
        writeValueField<double>(_name, val,"",dataSource->currentBitsPosition(),_bits,big);
        return val;
    }
//    template <typename T = uint64_t>
//    T writeField(MALAtomField field, int big = 1, std::string _extraVal="") {
//        return writeField(field.name, field.bits ,big, _extraVal,field.callback);
//    }
//    fast_any::any writeField(std::string _name, int64_t _bits, MDPFieldDisplayType type = MDPFieldDisplayType_int64,int big = 1, std::string _extraVal="" , std::function<fast_any::any(fast_any::any)> callback = NULL, fast_any::any *direct_val = nullptr) {
//        if (_bits > 0) {
//            _name = _name + "(" + std::to_string(_bits) + "bits" + ")";
//        }
//        if (_bits > 64 && type == MDPFieldDisplayType_int64) {
//            type = MDPFieldDisplayType_hex;
//        }
//        auto filed = std::make_shared<MALAtomField>(_name,dataSource->currentBitsPosition(),_bits,_extraVal);
//        if (type == MDPFieldDisplayType_int64) {
//            int64_t val = dataSource->readBitsInt64(_bits,0, big);
//            if (_bits == 0 && direct_val != nullptr && direct_val->has_value()) {
//                if (direct_val->as<uint64_t>()) {
//                    val = *(direct_val->as<uint64_t>());
//                } else if (direct_val->as<int64_t>()) {
//                    val = *(direct_val->as<int64_t>());
//                } else if (direct_val->as<int>()) {
//                    val = *(direct_val->as<int>());
//                } else if (direct_val->as<int32_t>()) {
//                    val = *(direct_val->as<int32_t>());
//                }  else if (direct_val->as<uint32_t>()) {
//                    val = *(direct_val->as<uint32_t>());
//                }
//            }
//            filed->putValue<uint64_t>(val,MDPFieldDisplayType_int64);
//        } else if (type == MDPFieldDisplayType_string) {
//            std::string val = dataSource->readBytesString(_bits/8);
//            if (_bits == 0 && direct_val != nullptr && direct_val->has_value()) {
//                val = *(direct_val->as<std::string>());
//            }
//            filed->putValue<std::string>(val,MDPFieldDisplayType_string);
//        } else if (type == MDPFieldDisplayType_fixed_16X16_float) {
//            unsigned char *data = dataSource->readBytesRaw(_bits/8);
//            double val = mdp_strconvet_to_fixed_16x16_point((char *)data);
//            if (_bits == 0 && direct_val != nullptr && direct_val->has_value()) {
//                val = *(direct_val->as<double>());
//            }
//            filed->putValue<double>(val,MDPFieldDisplayType_double);
//        } else if (type == MDPFieldDisplayType_hex) {
//            int bytes = _bits/8;
//            std::string val = "0x";
//            for (size_t i = 0; i < bytes; i++) {
//                val += mal_int_to_hex_string(dataSource->readBytesInt64(1)) + " ";
//            }
//            if (_bits == 0 && direct_val != nullptr && direct_val->has_value()) {
//                val = *(direct_val->as<std::string>());
//            }
//            filed->putValue<std::string>(val,MDPFieldDisplayType_string);
//        } else if (type == MDPFieldDisplayType_double) {
//            double val = 0;
//            if (_bits > 0) {
//                int64_t value = dataSource->readBitsInt64(_bits,0,big);
//                union tmp {
//                    int64_t a;
//                    double b;
//                };
//                union tmp t;
//                t.a = value;
//                val = t.b;
//            } else {
//                val = *(direct_val->as<double>());
//            }
//            
//            filed->putValue<double>(val,MDPFieldDisplayType_double);
//        } else if (type == MDPFieldDisplayType_separator){
//            filed->putValue<std::string>("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓",MDPFieldDisplayType_string);
//        }  else {
//            dataSource->skipBits(_bits);
//        }
//        if (callback) {
//            // fast_any::any any;
//            // any.emplace<int64_t>(val);
//            // val = *(callback(any).as<int64_t>());
//            if (filed->val.has_value()) {
//                filed->val = callback(filed->val);
//            }
//        }
//        fields.push_back(filed);
//        return filed->val;
//    }
//    template <class T = uint64_t>
//    T writeField(std::string _name, int64_t _bits, MDPFieldDisplayType type = MDPFieldDisplayType_int64, int big = 1, std::string _extraVal="" , std::function<fast_any::any(fast_any::any)> callback = NULL) {
//        fast_any::any val = writeField(_name,_bits,type,big,_extraVal,callback);
//        return *(val.as<T>());
//    }
//    template <typename T = uint64_t>
//    void writeValueField(std::string _name, T val, std::string _extraVal="") {
//        fast_any::any obj;
//        MDPFieldDisplayType type = MDPFieldDisplayType_int64;
//        if(std::is_same<T,int>::value || std::is_same<T,uint64_t>::value) {
//            type = MDPFieldDisplayType_int64;
//        } else if(std::is_same<T,std::string>::value) {
//            type = MDPFieldDisplayType_string;
//        } else if(std::is_same<T,double>::value) {
//            type = MDPFieldDisplayType_double;
//        }
//        obj.emplace<T>(val);
//        writeField(_name, 0,type,1,_extraVal,nullptr, &obj);
//    }
    
};
class MALFormatContext {
public:
    mal::proto::MALFormatContext proto_context;
    std::shared_ptr<MALAtom> root_atom;
    std::vector<std::shared_ptr<MALStream>> streams = {};
    AVFormatContext *ff_fmt_ctx = nullptr;
    ~MALFormatContext() {
        std::cout << "MALFormatContext release" << std::endl;
        if (ff_fmt_ctx) {
            avformat_free_context(ff_fmt_ctx);
        }
    }
    int newStream() {
        auto stream = std::make_shared<MALStream>();
        return addStream(stream);
    }
    int addStream(std::shared_ptr<MALStream> stream) {
        streams.push_back(stream);
        streams[index_]->proto_stream.set_index(index_);
        index_++;
        return 0;
    }
    void convert2ProtoFormatContext(proto::MALFormatContext *ctx) {
        ctx->CopyFrom(proto_context);
        ctx->clear_streams();
        for (auto &stream : streams) {
            auto proto_stream = ctx->add_streams();
            stream->convert2ProtoStream(proto_stream);
        }
        if (root_atom) {
            root_atom->convert2ProtoAtom(ctx->mutable_rootatom());
        }
    }
    std::shared_ptr<MALStream> currentStream() {
        if (index_ == 0) return nullptr;
        return streams[index_-1];
    }
    std::shared_ptr<MALStream> currentStream(int index) {
        if (index >= index_) return nullptr;
        return streams[index];
    }
    
    std::shared_ptr<IDataSource> datasource = nullptr;
    void addShallowWarning(std::string msg) {
        if (std::find(proto_context.shallowcheck().warnings().begin(), proto_context.shallowcheck().warnings().end(), msg) == proto_context.shallowcheck().warnings().end()) {
            proto_context.mutable_shallowcheck()->add_warnings(msg);
        }
    }
    void addShallowError(std::string msg) {
        if (std::find(proto_context.shallowcheck().errors().begin(), proto_context.shallowcheck().errors().end(), msg) == proto_context.shallowcheck().errors().end()) {
            proto_context.mutable_shallowcheck()->add_errors(msg);
        }
    }
    std::shared_ptr<MALFormatPrivData> priv = nullptr;
private:
    
    int index_ = 0;
};

} // namespace mdp

