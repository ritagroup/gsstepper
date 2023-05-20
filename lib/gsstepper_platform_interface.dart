import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gsstepper_method_channel.dart';

abstract class GsstepperPlatform extends PlatformInterface {
  /// Constructs a GsstepperPlatform.
  GsstepperPlatform() : super(token: _token);

  static final Object _token = Object();

  static GsstepperPlatform _instance = MethodChannelGsstepper();

  /// The default instance of [GsstepperPlatform] to use.
  ///
  /// Defaults to [MethodChannelGsstepper].
  static GsstepperPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GsstepperPlatform] when
  /// they register themselves.
  static set instance(GsstepperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
