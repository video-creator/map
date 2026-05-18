#pragma once

#include "mdp_ffi_types.h"

#ifdef __cplusplus
extern "C" {
#endif

// ──── 会话管理 ────
// 创建解析会话。返回 opaque pointer，所有后续操作都需要传入此指针。
void*   mdp_create_session(void);

// 销毁解析会话，释放所有关联资源。
void    mdp_destroy_session(void* session);

// ──── 媒体解析 ────
// 解析媒体文件。返回堆分配的 MDPBuffer（必须通过 mdp_free_buffer 释放）。
// 返回 NULL 表示失败。
MDPBuffer* mdp_parse_file(void* session, const char* path);

// 获取所有流信息。返回堆分配的 MDPBuffer。
MDPBuffer* mdp_get_all_stream_info(void* session);

// 获取 FormatContext（当所有 packet 读取完成后再次调用，可拿到检查结果）。
MDPBuffer* mdp_get_format_context(void* session);

// ──── 包/帧加载 ────
// 加载数据包。返回堆分配的 MDPBuffer。
MDPBuffer* mdp_load_packets(void* session, int32_t stream_index, int32_t size);

// 加载解码帧（元数据）。返回堆分配的 MDPBuffer。
// 帧像素数据为空，如需像素数据请调用 mdp_load_one_frame_data。
MDPBuffer* mdp_load_frames(void* session, int32_t stream_index, int32_t start, int32_t size);

// 获取单帧详细信息的 protobuf 数据。返回堆分配的 MDPBuffer。
MDPBuffer* mdp_load_one_frame_detail(void* session, int32_t stream_index, int64_t pos);

// ──── 帧裸数据（高性能路径，不走 protobuf）────
// 获取单帧的裸像素数据。返回堆分配的 MDPFrameData（必须通过 mdp_free_frame_data 释放）。
// 返回 NULL 表示失败。
MDPFrameData* mdp_load_one_frame_data(void* session, int32_t stream_index, int64_t pos);

// ──── 内存释放 ────
// 释放 MDPBuffer。
void mdp_free_buffer(MDPBuffer* buf);

// 释放 MDPFrameData。
void mdp_free_frame_data(MDPFrameData* frame);

// ──── 关闭 ────
// 关闭当前会话，释放所有关联的资源。
void mdp_close(void* session);

#ifdef __cplusplus
}
#endif