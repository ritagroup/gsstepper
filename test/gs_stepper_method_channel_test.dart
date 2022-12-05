import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gs_stepper/gs_stepper_method_channel.dart';

void main() {
  MethodChannelGsStepper platform = MethodChannelGsStepper();
  const MethodChannel channel = MethodChannel('gs_stepper');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
