import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'gsstepper_platform_interface.dart';

/// An implementation of [GsstepperPlatform] that uses method channels.
class MethodChannelGsstepper extends GsstepperPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('gsstepper');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
