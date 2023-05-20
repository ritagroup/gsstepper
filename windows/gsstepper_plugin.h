#ifndef FLUTTER_PLUGIN_GSSTEPPER_PLUGIN_H_
#define FLUTTER_PLUGIN_GSSTEPPER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace gsstepper {

class GsstepperPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  GsstepperPlugin();

  virtual ~GsstepperPlugin();

  // Disallow copy and assign.
  GsstepperPlugin(const GsstepperPlugin&) = delete;
  GsstepperPlugin& operator=(const GsstepperPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace gsstepper

#endif  // FLUTTER_PLUGIN_GSSTEPPER_PLUGIN_H_
