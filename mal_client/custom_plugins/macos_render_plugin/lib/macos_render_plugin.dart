
import 'macos_render_plugin_platform_interface.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
/// 像素格式定义
enum RenderPixelFormat {
  rgba8888, // 32-bit RGBA
  yuv420p,  // Planar YUV 4:2:0 (8-bit)
  yuv444p,  // Planar YUV 4:4:4 (8-bit)
  yuv420p10bit,
  yuvj420p,
}

/// HDR 传输函数 (Transfer Function)
enum HdrTransferFunction {
  sdr, // Standard Dynamic Range (Rec.709)
  pq,  // Perceptual Quantizer (SMPTE ST 2084) - HDR10
  hlg, // Hybrid Log-Gamma (ARIB STD-B67)
}

class MacosRenderPlugin {
  Future<String?> getPlatformVersion() {
    // return MacosRenderPluginPlatform.instance.getPlatformVersion();
    return _channel.invokeMethod("getPlatformVersion");
  }
  static const MethodChannel _channel = MethodChannel('macos_render_plugin');

  /// 创建一个新的渲染纹理，返回 textureId
  Future<int?> createTexture() async {
    final int? textureId = await _channel.invokeMethod('createTexture');
    return textureId;
  }

  /// 销毁纹理
  Future<void> disposeTexture(int textureId) async {
    await _channel.invokeMethod('disposeTexture', {'textureId': textureId});
  }

  /// 更新纹理数据
  ///
  /// [textureId]: createTexture 返回的 ID
  /// [data]: 原始像素数据
  /// [width]: 视频/图片宽度
  /// [height]: 视频/图片高度
  /// [format]: 像素格式
  /// [hdrMode]: HDR 模式 (默认 SDR)
  /// [strides]: (可选) 每个平面的步长，YUV格式时使用。如果为空则根据宽度自动计算。
  Future<void> updateTexture({
    required int textureId,
    required Uint8List data,
    required int width,
    required int height,
    required RenderPixelFormat format,
    HdrTransferFunction hdrMode = HdrTransferFunction.sdr,
    List<int>? strides,
  }) async {
    await _channel.invokeMethod('updateTexture', {
      'textureId': textureId,
      'data': data,
      'width': width,
      'height': height,
      'format': format.index,
      'hdrMode': hdrMode.index,
      'strides': strides ?? [],
    });
  }
}
