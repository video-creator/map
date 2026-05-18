import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'macos_render_plugin_method_channel.dart';

abstract class MacosRenderPluginPlatform extends PlatformInterface {
  /// Constructs a MacosRenderPluginPlatform.
  MacosRenderPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MacosRenderPluginPlatform _instance = MethodChannelMacosRenderPlugin();

  /// The default instance of [MacosRenderPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelMacosRenderPlugin].
  static MacosRenderPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MacosRenderPluginPlatform] when
  /// they register themselves.
  static set instance(MacosRenderPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
