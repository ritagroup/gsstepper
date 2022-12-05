import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gs_stepper_method_channel.dart';

abstract class GsStepperPlatform extends PlatformInterface {
  /// Constructs a GsStepperPlatform.
  GsStepperPlatform() : super(token: _token);

  static final Object _token = Object();

  static GsStepperPlatform _instance = MethodChannelGsStepper();

  /// The default instance of [GsStepperPlatform] to use.
  ///
  /// Defaults to [MethodChannelGsStepper].
  static GsStepperPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GsStepperPlatform] when
  /// they register themselves.
  static set instance(GsStepperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
