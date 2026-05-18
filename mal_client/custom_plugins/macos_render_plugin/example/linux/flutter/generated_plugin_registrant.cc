//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <macos_render_plugin/macos_render_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) macos_render_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MacosRenderPlugin");
  macos_render_plugin_register_with_registrar(macos_render_plugin_registrar);
}
