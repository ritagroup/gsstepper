import 'package:flutter_test/flutter_test.dart';
import 'package:gsstepper/gsstepper.dart';
import 'package:gsstepper/gsstepper_method_channel.dart';
import 'package:gsstepper/gsstepper_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGsstepperPlatform
    with MockPlatformInterfaceMixin
    implements GsstepperPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GsstepperPlatform initialPlatform = GsstepperPlatform.instance;

  test('$MethodChannelGsstepper is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGsstepper>());
  });

  test('getPlatformVersion', () async {
    Gsstepper gsstepperPlugin = Gsstepper();
    MockGsstepperPlatform fakePlatform = MockGsstepperPlatform();
    GsstepperPlatform.instance = fakePlatform;

    expect(await gsstepperPlugin.getPlatformVersion(), '42');
  });
}
