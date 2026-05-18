#include "include/macos_render_plugin/macos_render_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "macos_render_plugin.h"

void MacosRenderPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  macos_render_plugin::MacosRenderPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
