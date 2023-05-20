#include "include/gsstepper/gsstepper_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "gsstepper_plugin.h"

void GsstepperPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  gsstepper::GsstepperPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
