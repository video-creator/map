import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'macos_render_plugin_platform_interface.dart';

/// An implementation of [MacosRenderPluginPlatform] that uses method channels.
class MethodChannelMacosRenderPlugin extends MacosRenderPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('macos_render_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
