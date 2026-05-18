#ifndef FLUTTER_PLUGIN_MACOS_RENDER_PLUGIN_H_
#define FLUTTER_PLUGIN_MACOS_RENDER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace macos_render_plugin {

class MacosRenderPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MacosRenderPlugin();

  virtual ~MacosRenderPlugin();

  // Disallow copy and assign.
  MacosRenderPlugin(const MacosRenderPlugin&) = delete;
  MacosRenderPlugin& operator=(const MacosRenderPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace macos_render_plugin

#endif  // FLUTTER_PLUGIN_MACOS_RENDER_PLUGIN_H_
