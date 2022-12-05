
import 'gs_stepper_platform_interface.dart';

class GsStepper {
  Future<String?> getPlatformVersion() {
    return GsStepperPlatform.instance.getPlatformVersion();
  }
}
