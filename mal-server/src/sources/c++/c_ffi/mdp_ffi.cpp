#include "mdp_ffi.h"
#include <cstring>
#include <cstdlib>
#include <string>
#include <vector>
#include <memory>
#include <iostream>
#include <unordered_map>
#include <mutex>
#include <sys/syslog.h>

#include "../parser/mal_i_parser.h"
#include "../parser/mal_mov_parser.h"
#include "../parser/mal_webp_parser.hpp"
#include "../parser/mal_flv_parser.hpp"
#include "../parser/mal_matroska_parser.hpp"
#include "../parser/mal_png_parser.hpp"
#include "../parser/mal_jpg_parser.hpp"
#include "../loader/mal_mp4_packet_loader.hpp"

#include "../proto_gen/mal_service.pb.h"
#include "../proto_gen/mal.pb.h"

using namespace mal;

// ──── Session 管理 ────
// session 是 shared_ptr<IParser>* 的堆上实例

static std::shared_ptr<IParser> session_get_parser(void* session) {
    if (!session) return nullptr;
    auto* p = static_cast<std::shared_ptr<IParser>*>(session);
    return *p;
}

// ──── 辅助函数 ────

static std::shared_ptr<IParser> create_parser_for_path(const std::string& path) {
    std::vector<std::shared_ptr<IParser>> parsers = {
        std::make_shared<MP4Parser>(path, Type::local),
        std::make_shared<WEBPParser>(path, Type::local),
        std::make_shared<FLVPParser>(path, Type::local),
        std::make_shared<MALMatroskaParser>(path, Type::local),
        std::make_shared<MALPNGParser>(path, Type::local),
        std::make_shared<JPGParser>(path, Type::local)
    };
    for (auto& el : parsers) {
        if (el->supportFormat()) {
            return el;
        }
    }
    return nullptr;
}

// 将 protobuf message 序列化，返回堆分配的 MDPBuffer
static MDPBuffer* proto_to_buffer(const google::protobuf::Message& msg) {
    std::string serialized;
    if (!msg.SerializeToString(&serialized)) {
        return nullptr;
    }

    MDPBuffer* buf = (MDPBuffer*)malloc(sizeof(MDPBuffer));
    if (!buf) return nullptr;

    buf->size = (int32_t)serialized.size();
    buf->data = (uint8_t*)malloc(buf->size);
    if (!buf->data) {
        free(buf);
        return nullptr;
    }
    memcpy(buf->data, serialized.data(), buf->size);
    return buf;
}

// ──── 会话管理 ────

void* mdp_create_session(void) {
    auto* session = new std::shared_ptr<IParser>(nullptr);
    return session;
}

void mdp_destroy_session(void* session) {
    if (!session) return;
    auto* p = static_cast<std::shared_ptr<IParser>*>(session);
    if (*p) {
        (*p)->close();
    }
    delete p;
}

// ──── 媒体解析 ────

MDPBuffer* mdp_parse_file(void* session, const char* path) {
    if (!session || !path) return nullptr;

    // DIAG: 用 syslog 避免沙箱屏蔽 /tmp 写入
    FILE* fp__ = fopen(path, "rb");
    if (fp__) {
        syslog(LOG_ERR, "[mdp_ffi_DIAG] fopen(%s): OK", path);
        fclose(fp__);
    } else {
        syslog(LOG_ERR, "[mdp_ffi_DIAG] fopen(%s): FAILED errno=%d", path, errno);
    }

    try {
        auto parser = create_parser_for_path(std::string(path));
        if (!parser) {
            std::cerr << "[mdp_ffi] No parser found for: " << path << std::endl;
            return nullptr;
        }

        auto* p = static_cast<std::shared_ptr<IParser>*>(session);
        *p = parser;

        parser->startParse();

        ::mal::service::ParseFileResponse response;
        parser->convert2ProtoFormatContext(response.mutable_context());
        response.mutable_base()->set_success(true);

        return proto_to_buffer(response);

    } catch (const std::exception& e) {
        std::cerr << "[mdp_ffi] ParseFile error: " << e.what() << std::endl;
        return nullptr;
    }
}

MDPBuffer* mdp_get_all_stream_info(void* session) {
    auto parser = session_get_parser(session);
    if (!parser) return nullptr;

    try {
        ::mal::service::GetAllStreamInfoResponse response;
        for (auto& stream : parser->malFormatContext()->streams) {
            stream->convert2ProtoStream(response.add_streams());
        }
        response.mutable_base()->set_success(true);
        return proto_to_buffer(response);
    } catch (const std::exception& e) {
        std::cerr << "[mdp_ffi] GetAllStreamInfo error: " << e.what() << std::endl;
        return nullptr;
    }
}

MDPBuffer* mdp_get_format_context(void* session) {
    auto parser = session_get_parser(session);
    if (!parser) return nullptr;

    try {
        ::mal::service::ParseFileResponse response;
        parser->convert2ProtoFormatContext(response.mutable_context());
        response.mutable_base()->set_success(true);
        return proto_to_buffer(response);
    } catch (const std::exception& e) {
        std::cerr << "[mdp_ffi] GetFormatContext error: " << e.what() << std::endl;
        return nullptr;
    }
}

// ──── 包/帧加载 ────

MDPBuffer* mdp_load_packets(void* session, int32_t stream_index, int32_t size) {
    auto parser = session_get_parser(session);
    if (!parser) return nullptr;

    try {
        auto it = parser->pktLoaders.find(stream_index);
        if (it == parser->pktLoaders.end() || !it->second) {
            return nullptr;
        }

        ::mal::service::LoadPacketsResponse response;
        auto pkts = it->second->loadPackets(size);
        for (auto& pkt : pkts) {
            pkt->convert2ProtoPakcet(response.add_packets());
        }
        response.mutable_base()->set_success(true);
        return proto_to_buffer(response);
    } catch (const std::exception& e) {
        std::cerr << "[mdp_ffi] LoadPackets error: " << e.what() << std::endl;
        return nullptr;
    }
}

MDPBuffer* mdp_load_frames(void* session, int32_t stream_index, int32_t start, int32_t size) {
    auto parser = session_get_parser(session);
    if (!parser) return nullptr;

    try {
        auto it = parser->pktLoaders.find(stream_index);
        if (it == parser->pktLoaders.end() || !it->second) {
            return nullptr;
        }

        ::mal::service::LoadFramesResponse response;
        auto frames = it->second->loadFrames(start, size);
        for (auto& frame : frames) {
            frame->convert2ProtoFrame(response.add_frames());
        }
        response.mutable_base()->set_success(true);
        return proto_to_buffer(response);
    } catch (const std::exception& e) {
        std::cerr << "[mdp_ffi] LoadFrames error: " << e.what() << std::endl;
        return nullptr;
    }
}

MDPBuffer* mdp_load_one_frame_detail(void* session, int32_t stream_index, int64_t pos) {
    auto parser = session_get_parser(session);
    if (!parser) return nullptr;

    try {
        auto it = parser->pktLoaders.find(stream_index);
        if (it == parser->pktLoaders.end() || !it->second) {
            return nullptr;
        }

        ::mal::service::LoadOneFrameResponse response;
        auto frame = it->second->loadOneFrameDetail(pos);
        if (frame) {
            response.mutable_frame()->CopyFrom(frame->proto_frame);
            response.mutable_base()->set_success(true);
        } else {
            response.mutable_base()->set_success(false);
            response.mutable_base()->set_error_message("Frame not found");
        }
        return proto_to_buffer(response);
    } catch (const std::exception& e) {
        std::cerr << "[mdp_ffi] LoadOneFrameDetail error: " << e.what() << std::endl;
        return nullptr;
    }
}

// ──── 帧裸数据（高性能路径）────

MDPFrameData* mdp_load_one_frame_data(void* session, int32_t stream_index, int64_t pos) {
    auto parser = session_get_parser(session);
    if (!parser) return nullptr;

    try {
        auto it = parser->pktLoaders.find(stream_index);
        if (it == parser->pktLoaders.end() || !it->second) {
            return nullptr;
        }

        auto frame = it->second->loadOneFrameDetail(pos);
        if (!frame) return nullptr;

        frame->get_detail_info();

        const auto& video_frame = frame->proto_frame.video_frame();
        int data_size = video_frame.frame_data().size();
        if (data_size <= 0) return nullptr;

        MDPFrameData* out = (MDPFrameData*)malloc(sizeof(MDPFrameData));
        if (!out) return nullptr;

        out->data = (uint8_t*)malloc(data_size);
        if (!out->data) {
            free(out);
            return nullptr;
        }

        memcpy(out->data, video_frame.frame_data().data(), data_size);
        out->size = data_size;
        out->width = video_frame.width();
        out->height = video_frame.height();
        out->pixel_format = video_frame.pixel_format();

        return out;

    } catch (const std::exception& e) {
        std::cerr << "[mdp_ffi] LoadOneFrameData error: " << e.what() << std::endl;
        return nullptr;
    }
}

// ──── 内存释放 ────

void mdp_free_buffer(MDPBuffer* buf) {
    if (!buf) return;
    if (buf->data) {
        free(buf->data);
    }
    free(buf);
}

void mdp_free_frame_data(MDPFrameData* frame) {
    if (!frame) return;
    if (frame->data) {
        free(frame->data);
    }
    free(frame);
}

// ──── 关闭 ────

void mdp_close(void* session) {
    if (!session) return;
    auto* p = static_cast<std::shared_ptr<IParser>*>(session);
    if (*p) {
        (*p)->close();
        p->reset();
    }
}