
import 'gsstepper_platform_interface.dart';

class Gsstepper {
  Future<String?> getPlatformVersion() {
    return GsstepperPlatform.instance.getPlatformVersion();
  }
}
