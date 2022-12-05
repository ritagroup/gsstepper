import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gs_stepper_platform_interface.dart';

/// An implementation of [GsStepperPlatform] that uses method channels.
class MethodChannelGsStepper extends GsStepperPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gs_stepper');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
