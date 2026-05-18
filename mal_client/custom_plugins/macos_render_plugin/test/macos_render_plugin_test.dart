import 'package:flutter_test/flutter_test.dart';
import 'package:macos_render_plugin/macos_render_plugin.dart';
import 'package:macos_render_plugin/macos_render_plugin_platform_interface.dart';
import 'package:macos_render_plugin/macos_render_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMacosRenderPluginPlatform
    with MockPlatformInterfaceMixin
    implements MacosRenderPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MacosRenderPluginPlatform initialPlatform = MacosRenderPluginPlatform.instance;

  test('$MethodChannelMacosRenderPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMacosRenderPlugin>());
  });

  test('getPlatformVersion', () async {
    MacosRenderPlugin macosRenderPlugin = MacosRenderPlugin();
    MockMacosRenderPluginPlatform fakePlatform = MockMacosRenderPluginPlatform();
    MacosRenderPluginPlatform.instance = fakePlatform;

    expect(await macosRenderPlugin.getPlatformVersion(), '42');
  });
}
