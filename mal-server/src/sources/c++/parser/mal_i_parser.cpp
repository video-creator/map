#include "mal_i_parser.h"
#include "mal_local_datasource.h"
#include "../loader/mal_ff_packet_loader.hpp"
#include "../deps/spdlog/formatter.h"
#include "../parser/mal_dump.hpp"
extern "C" {
#include <libavutil/avassert.h>
#include <libavformat/avformat.h>
#include "../../utils/cJSON.h"
}
#include <fstream>
#include <unordered_set>
#include <vector>
#include <iostream>
using namespace mal;
IParser::IParser(const std::shared_ptr<IDataSource>& datasource):_datasource(datasource) {
    malFormatContext_ = std::make_shared<MALFormatContext>();
    malFormatContext_->datasource = datasource->shallowCopy();
}
IParser::IParser(const std::string& path, Type type) {
    malFormatContext_ = std::make_shared<MALFormatContext>();
    if (type == Type::local) {
        _datasource = std::make_shared<LocalDataSource>(path);
    } else {
        av_assert0(true);
    }
    _datasource->open();
    malFormatContext_->datasource = _datasource->shallowCopy();
    avformat_open_input(&malFormatContext_->ff_fmt_ctx, path.c_str(), nullptr, nullptr);
    if (malFormatContext_->ff_fmt_ctx) {
        int ret = 0;
        if ((ret = avformat_find_stream_info(malFormatContext_->ff_fmt_ctx, nullptr)) < 0) {
            av_assert0(true);
        }
    }
        
}
int IParser::startParse() {
    return 0;
}

bool IParser::supportFormat() {
    return false;
}
static cJSON *dumpBox(std::vector<std::shared_ptr<MALAtom>> atoms, int full) {
    cJSON *array = cJSON_CreateArray();
    for (auto &atom : atoms) {
        cJSON *obj = cJSON_CreateObject();
        cJSON *attr_obj = cJSON_CreateObject();
        cJSON_AddNumberToObject(attr_obj, "size", atom->size);
        cJSON_AddNumberToObject(attr_obj, "pos", atom->pos);
        cJSON_AddItemToObject(obj, atom->name.c_str(), attr_obj);
        cJSON_AddItemToArray(array, obj);
        if (full) {
            for (auto &filed : atom->fields) {
                std::string val = filed->proto_field.value();
//                if (filed->display_type == MDPFieldDisplayType_int64 &&
//                    filed->val.has_value()) {
//                    val = std::to_string(*(filed->val.as<uint64_t>()));// cJSON_AddNumberToObject(attr_obj, filed->name.c_str(),
////                                            *(filed->val.as<uint64_t>()));
//                } else if (filed->display_type ==
//                           MDPFieldDisplayType_string &&
//                           filed->val.has_value()) {
//                    val = *(filed->val.as<std::string>());
////                    cJSON_AddStringToObject(attr_obj, filed->name.c_str(),
////                                            filed->val.as<std::string>()->c_str());
//                } else if (filed->display_type ==
//                           MDPFieldDisplayType_double &&
//                           filed->val.has_value()) {
//                    val = std::to_string(*(filed->val.as<double>())) ;
////                    cJSON_AddNumberToObject(attr_obj, filed->name.c_str(),
////                                            (*filed->val.as<double>()));
//                }
//                if (filed->extraVal.length() > 0) {
//                    val += fmt::format("({})",filed->extraVal);
//                }
                cJSON_AddStringToObject(attr_obj, filed->proto_field.name().c_str(),val.c_str());
            }
        }
        
        
        if (atom->childBoxs.size() > 0) {
            cJSON *child_array = dumpBox(atom->childBoxs, full);
            if (child_array) {
                cJSON_AddItemToObject(attr_obj, "children", child_array);
            }
        }
    }
    return array;
}
std::string IParser::dumpFormats(int full) {
//    if (root_atom_ != nullptr) {
//      std::vector<std::shared_ptr<MALAtom>> atoms = {root_atom_};
//      cJSON *json = dumpBox(atoms,full);
//      char *string = cJSON_Print(json);
//      std::string filename = "/Users/Shared/output.json";
//
//      // 创建一个输出文件流
//      std::ofstream outputFile(filename);
//
//      // 检查文件是否成功打开
//      if (!outputFile) {
//        std::cerr << "无法打开文件: " << filename << std::endl;
//        return ""; // 返回错误代码
//      }
//      // 将 JSON 字符串写入文件
//      outputFile << string;
//
//      // 关闭文件
//      outputFile.close();
//    }
    return "";
}
std::string IParser::dumpShallowCheck() {
    cJSON *shallow = cJSON_CreateObject();
    cJSON *warningArray = cJSON_CreateArray();
    cJSON_AddItemToObject(shallow, "warning", warningArray);
    for (auto el : malFormatContext_->proto_context.shallowcheck().warnings()) {
        cJSON_AddStringToObject(warningArray, "", el.c_str());
    }
    cJSON *errorArray = cJSON_CreateArray();
    cJSON_AddItemToObject(shallow, "error", errorArray);
    for (auto el : malFormatContext_->proto_context.shallowcheck().errors()) {
        cJSON_AddStringToObject(errorArray, "", el.c_str());
    }
    char *string = cJSON_Print(shallow);
    std::cout << string << std::endl;
    return string;
}
std::string IParser::dumpDeepCheck() {
    return "";
}
std::string IParser::dumpVideoConfig() {
    return "";
}
IParser::~IParser() {

}
