import 'dart:ffi';

import 'package:base_utility/utiles/file.dart';
import 'package:fixnum/src/int64.dart';
import 'package:flutter/cupertino.dart';
import 'package:mal_client/rpc_client/proto_gen/mal.pb.dart';
import 'package:mal_client/rpc_client/proto_gen/stream.pb.dart';

import '../ffi_client/ffi_client.dart';
import '../rpc_client/proto_gen/mal_service.pb.dart';

mixin MediaInfo {

  String path_ = "";
  MdpFfiClient? client_;
  MALFormatContext? formatContext;
  Map<int, MALStream> streamsInfo = {};
  LocalFileReader? fileReader;
  MALStream? get currentStream {
    if (streamIndex >= 0 && streamIndex < (formatContext?.streams.length ?? 0)) {
      return formatContext?.streams[streamIndex];
    }
    return null;
  }
  String get path{
    return path_;
  }
  int _streamIndex = -1;
  int get streamIndex {
    if (formatContext != null && _streamIndex == -1) {
      for (var stream in formatContext!.streams) {
        if (stream.mediaType == MALMediaType.MAL_MEDIA_TYPE_VIDEO || stream.mediaType == MALMediaType.MAL_MEDIA_TYPE_STATIC_Image) {
          _streamIndex = stream.index;
          break;
        }

      }
    }
    return _streamIndex;
  }
  set streamIndex(int index) {
    _streamIndex = index;
  }
  void createRPCClient() {
    client_ ??= MdpFfiClient();
  }
  Future<ParseFileResponse> startParser(String path) async {
    path_ = path;
    try {
      debugPrint('[media_info] startParser: opening fileReader for path=$path');
      fileReader = await LocalFileReader.open(path);
      debugPrint('[media_info] fileReader opened');
      createRPCClient();
      debugPrint('[media_info] calling client_.parseFile...');
      var bytes = client_!.parseFile(path);
      debugPrint('[media_info] parseFile returned, bytes=${bytes?.length}');
      if (bytes != null) {
        debugPrint('[media_info] trying to deserialize ParseFileResponse, size=${bytes.length}');
        var response = ParseFileResponse.fromBuffer(bytes);
        debugPrint('[media_info] deserialized, success=${response.base.success}');
        if (response.base.success) {
          formatContext = response.context;
          debugPrint("startParser 赋值数据 rootatom = ${formatContext?.rootAtom != null}");
        }
        return response;
      }
      debugPrint('[media_info] bytes is null - FFI returned null!');
      ParseFileResponse response = ParseFileResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "解析文件失败(FFI返回空)!";
      return response;
    } catch (e) {
      debugPrint('[media_info] CRASH in startParser: $e');
      debugPrint('[media_info] stacktrace: ${StackTrace.current}');
      // 捕获异常并打印日志
      ParseFileResponse response = ParseFileResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "解析文件发生异常!";
      return  response;
    }
  }
  Future<GetStreamInfoResponse> getStreamInfo() async {
    try {
      if (streamIndex < 0) {
        GetStreamInfoResponse response = GetStreamInfoResponse();
        response.ensureBase().success = false;
        response.ensureBase().errorMessage = "没有查找到相关流,stream index: $streamIndex!";
        return response;
      }
      if (streamsInfo.containsKey(streamIndex) ?? false) {
        GetStreamInfoResponse response = GetStreamInfoResponse()
                                          ..stream  = streamsInfo[streamIndex]!
                                          ..base = (BaseResponse()..success = true);
        return response;
      }
      var bytes = client_!.getAllStreamInfo();
      if (bytes != null) {
        var allInfo = GetAllStreamInfoResponse.fromBuffer(bytes);
        for (var s in allInfo.streams) {
          streamsInfo[s.index] = s;
        }
        if (streamsInfo.containsKey(streamIndex)) {
          GetStreamInfoResponse response = GetStreamInfoResponse()
            ..stream = streamsInfo[streamIndex]!
            ..base = (BaseResponse()..success = true);
          return response;
        }
      }
      GetStreamInfoResponse response = GetStreamInfoResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取stream信息失败!";
      return response;
    } catch (e) {
      // 捕获异常并打印日志
      GetStreamInfoResponse response = GetStreamInfoResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取stream信息发生错误!";
      return  response;
    }
  }

  Future<GetAllStreamInfoResponse> getAllStreamInfo() async {
    try {
      var bytes = client_!.getAllStreamInfo();
      if (bytes != null) {
        return GetAllStreamInfoResponse.fromBuffer(bytes);
      }
      GetAllStreamInfoResponse response = GetAllStreamInfoResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取stream信息失败!";
      return response;
    } catch (e) {
      // 捕获异常并打印日志
      GetAllStreamInfoResponse response = GetAllStreamInfoResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取stream信息发生错误!";
      return  response;
    }
  }

  Future<LoadPacketsResponse> loadPackets({int size = 100}) async {
    try {
      if (streamIndex < 0) {
        LoadPacketsResponse response = LoadPacketsResponse();
        response.ensureBase().success = false;
        response.ensureBase().errorMessage = "没有查找到相关流,stream index: $streamIndex!";
        return response;
      }
      var bytes = client_!.loadPackets(streamIndex, size);
      if (bytes != null) {
        return LoadPacketsResponse.fromBuffer(bytes);
      }
      LoadPacketsResponse response = LoadPacketsResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取packet信息失败!";
      return response;
    } catch (e) {
      // 捕获异常并打印日志
      LoadPacketsResponse response = LoadPacketsResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取stream信息发生错误!";
      return  response;
    }
  }

  Future<LoadFramesResponse> loadFrames(int start, {int size = 100}) async {
    try {
      var bytes = client_!.loadFrames(streamIndex, start, size);
      if (bytes != null) {
        return LoadFramesResponse.fromBuffer(bytes);
      }
      LoadFramesResponse response = LoadFramesResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取Frame信息失败!";
      return response;
    } catch (e) {
      debugPrint(e.toString());
      // 捕获异常并打印日志
      LoadFramesResponse response = LoadFramesResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取Frame信息发生错误!error: ${e}";
      return  response;
    }
  }

  Future<LoadOneFrameResponse> loadOneFrameDetail(Int64 pos) async {
    try {
      var bytes = client_!.loadOneFrameDetail(streamIndex, pos.toInt());
      if (bytes != null) {
        return LoadOneFrameResponse.fromBuffer(bytes);
      }
      LoadOneFrameResponse response = LoadOneFrameResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取Frame详情失败!";
      return response;
    } catch (e) {
      debugPrint(e.toString());
      // 捕获异常并打印日志
      LoadOneFrameResponse response = LoadOneFrameResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取Frame信息发生错误!error: ${e}";
      return  response;
    }
  }

  Future<ParseFileResponse> getFileFormatContextInfo() async {
    try {
      var bytes = client_!.getFormatContext();
      if (bytes != null) {
        var response = ParseFileResponse.fromBuffer(bytes);
        if (response.base.success) {
          formatContext = response.context;
        }
        return response;
      }
      var response = ParseFileResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取FormatContext信息失败!";
      return response;
    } catch (e) {
      debugPrint(e.toString());
      // 捕获异常并打印日志
      var response = ParseFileResponse();
      response.ensureBase().success = false;
      response.ensureBase().errorMessage = "获取FormatContext信息发生错误!error: ${e}";
      return  response;
    }
  }

  /// 获取单帧裸像素数据（高性能路径，不走 protobuf）。
  /// 返回 MDPFrameData（包含裸像素数据指针），调用方必须调用 [freeFrameData] 释放。
  MDPFrameData? loadOneFrameData(int streamIndex, int pos) {
    try {
      return client_?.loadOneFrameData(streamIndex, pos);
    } catch (e) {
      debugPrint("loadOneFrameData error: $e");
      return null;
    }
  }

  /// 释放 [loadOneFrameData] 返回的帧数据。
  void freeFrameData(Pointer<MDPFrameData> frame) {
    client_?.freeFrameData(frame);
  }

  void closeClient() {
      fileReader?.close();
      client_?.close();
  }
}