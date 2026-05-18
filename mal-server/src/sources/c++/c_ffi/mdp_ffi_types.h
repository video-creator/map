#ifndef MDP_FFI_TYPES_H
#define MDP_FFI_TYPES_H

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

// FFI 返回结果：序列化 protobuf 数据
// 通过 malloc 分配，Dart 端用完后调用 mdp_free_buffer 释放
typedef struct {
    uint8_t* data;      // 序列化字节
    int32_t  size;      // 数据长度
} MDPBuffer;

// 帧数据（不走 protobuf，裸数据传递）
// 通过 malloc 分配，Dart 端用完后调用 mdp_free_frame_data 释放
typedef struct {
    uint8_t* data;      // 原始像素数据 (frame_data)
    int32_t  size;      // 数据长度
    int32_t  width;     // 图像宽度
    int32_t  height;    // 图像高度
    int32_t  pixel_format; // MALVideoPixelFormat 枚举值
} MDPFrameData;

#ifdef __cplusplus
}
#endif

#endif /* MDP_FFI_TYPES_H */