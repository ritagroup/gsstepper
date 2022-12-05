import 'package:flutter_test/flutter_test.dart';
import 'package:gs_stepper/gs_stepper.dart';
import 'package:gs_stepper/gs_stepper_platform_interface.dart';
import 'package:gs_stepper/gs_stepper_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGsStepperPlatform 
    with MockPlatformInterfaceMixin
    implements GsStepperPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GsStepperPlatform initialPlatform = GsStepperPlatform.instance;

  test('$MethodChannelGsStepper is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGsStepper>());
  });

  test('getPlatformVersion', () async {
    GsStepper gsStepperPlugin = GsStepper();
    MockGsStepperPlatform fakePlatform = MockGsStepperPlatform();
    GsStepperPlatform.instance = fakePlatform;
  
    expect(await gsStepperPlugin.getPlatformVersion(), '42');
  });
}
