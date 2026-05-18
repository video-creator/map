//
//  main.cpp
//  Demo
//
//  Created by wangyaqiang on 2024/10/31.
//

#include <iostream>
#include "../../src/sources/Test.hpp"
extern "C" {
#include "../../src/sources/c++/c_ffi/mdp_ffi.h"
}
int main(int argc, const char * argv[]) {
    // 使用新的 FFI API 替代旧的 gRPC server_start()
    void* session = mdp_create_session();
    if (!session) {
        std::cerr << "Failed to create session" << std::endl;
        return 1;
    }
    int oo = 0;
//    GetUserInfoFromSEI("/Users/wangyaqiang/Downloads/h264_ffsei.mp4", &oo);
    
    // insert code here...
    std::cout << "Hello, World!\n";
    char * url = "/Users/Shared/test.heif"; //heif
    url = "/Users/Shared/download_h264_p.mp4"; //264
//    url = "/Users/wangyaqiang/Downloads/32722298.mp4"; //ipcm
//    url = "/Users/Shared/download.mp4"; //fmp4
    url = "/Users/Shared/download_h265.mp4";
//    url = "/Users/Shared/fpcm.mp4";
//    url = "/Users/Shared/big_264.mp4";
//    url = "/Users/Shared/big_264_moov后置_720.mp4";
//    url = "/Users/Shared/big_264_moov前置_720.mp4";
//    url = "/Users/Shared/big_264_moov后置_1080.mp4";
//    url = "/Users/Shared/big_264_moov前置_1080.mp4";
//    url = "/Users/wangyaqiang/Downloads/32722298.mp4";
//    url = "/Users/wangyaqiang/Downloads/148152435969.mp4";
//    url = "/Users/wangyaqiang/Downloads/5821471915_hd.kpg";
//    url = "/Users/wangyaqiang/Downloads/5821471917_hd.kpg";
//    url = "/Users/wangyaqiang/Downloads/live_merchant_interpreting_cdn-t+sclae_yuv_mscale.webp";
//    url = "/Users/Shared/lossless.webp";
//    url = "/Users/Shared/test.flv";
//    url = "/Users/Shared/download_265_enhance.flv";
//    url = "/Users/wangyaqiang/Downloads/7776_fast.mp4";
//    url = "/Users/wangyaqiang/Downloads/混编.MOV";
//    url = "/Users/Shared/enableHDR_export_色彩空间混乱素材.mp4";
//    url = "/Users/wangyaqiang/Downloads/5255419298299447855_fe03be05481d9930_4739_v7HMidV3.mp4";
//    url = "/Users/Shared/download_h264_b.mp4";
//    url = "/Users/Shared/300160731_0_aweme_7bf1080bb3aa4f57aba69eb28ed45da5_7423534304669519138_20241120095023.mp4";
//    url = "/Users/wangyaqiang/Downloads/concat.mp4"; //大文件
//    url = "/Users/Shared/300160731_0_aweme_7bf1080bb3aa4f57aba69eb28ed45da5_7423534304669519138_20241120095023.mp4";
    url = "/Users/Shared/5821615946_pts_倒退-转码12s后抖动.mp4"; //open gop
//    url = "/Users/wangyaqiang/Downloads/lv_0_20250114172125.mp4";
//    url = "/Users/wangyaqiang/Downloads/lv_0_20241215173614.mp4";
//    url = "/Users/wangyaqiang/Downloads/h265_ffsei_sei.mp4";
//    url = "/Users/Shared/多个sps—hevc_hdr.mp4"; 
//    url = "/Users/Shared/editlist长度影响时长.mp4";
//    url = "/Users/wangyaqiang/Downloads/tt3.mov";
    url = "/Users/wangyaqiang/Downloads/b帧可以播放.mp4";
//    url = "/Users/wangyaqiang/Downloads/fix32/o3mg2.mp4"; //ios16.1.2花屏
//    url = "Users/Shared/multi_slice_mac无法播放.mp4";
//    url = "/Users/Shared/有sar.mp4";
//    url = "/Users/wangyaqiang/Downloads/122743331080.mp4";
    url = "/Users/Shared/多个pps-android花屏.mov";
//    url = "/Users/Shared/多个pps-android正常-hdr.MOV";
//    url = "/Users/wangyaqiang/Downloads/xxxx.mp4";
//    url = "/Users/wangyaqiang/Downloads/37424628872.mp4";
//    url = "/Users/wangyaqiang/Downloads/7e4c82d06c8fac405246c7678faab2f76bf845f04cd8970511c9e53a42055159.mp4";
//    
//    url = "/Users/wangyaqiang/Downloads/concat.mp4";
//    url = "/Users/wangyaqiang/Downloads/39346366722.mp4";
    url = "/Users/wangyaqiang/Downloads/zhouchuchusanhai_out.mkv";
    if (argc > 1) {
        url = (char *)argv[1];
    }

    // 使用新的 FFI API 进行文件解析
    MDPBuffer* result = mdp_parse_file(session, url);
    if (result && result->data && result->size > 0) {
        std::cout << "Parse success, data size: " << result->size << " bytes" << std::endl;
        mdp_free_buffer(result);
    } else {
        std::cerr << "Parse failed" << std::endl;
    }

    // 获取流信息
    MDPBuffer* stream_info = mdp_get_all_stream_info(session);
    if (stream_info && stream_info->data) {
        std::cout << "Stream info size: " << stream_info->size << " bytes" << std::endl;
        mdp_free_buffer(stream_info);
    }

    mdp_close(session);
    mdp_destroy_session(session);
    std::cout << "Hello, World!\n";
    return 0;
}

