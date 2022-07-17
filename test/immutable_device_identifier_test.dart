import 'package:flutter_test/flutter_test.dart';
import 'package:immutable_device_identifier/immutable_device_identifier.dart';
import 'package:immutable_device_identifier/immutable_device_identifier_platform_interface.dart';
import 'package:immutable_device_identifier/immutable_device_identifier_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockImmutableDeviceIdentifierPlatform 
    with MockPlatformInterfaceMixin
    implements ImmutableDeviceIdentifierPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ImmutableDeviceIdentifierPlatform initialPlatform = ImmutableDeviceIdentifierPlatform.instance;

  test('$MethodChannelImmutableDeviceIdentifier is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelImmutableDeviceIdentifier>());
  });

  test('getPlatformVersion', () async {
    ImmutableDeviceIdentifier immutableDeviceIdentifierPlugin = ImmutableDeviceIdentifier();
    MockImmutableDeviceIdentifierPlatform fakePlatform = MockImmutableDeviceIdentifierPlatform();
    ImmutableDeviceIdentifierPlatform.instance = fakePlatform;
  
    expect(await immutableDeviceIdentifierPlugin.getPlatformVersion(), '42');
  });
}
