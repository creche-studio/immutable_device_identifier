
import 'immutable_device_identifier_platform_interface.dart';

class ImmutableDeviceIdentifier {
  Future<String?> getPlatformVersion() {
    return ImmutableDeviceIdentifierPlatform.instance.getPlatformVersion();
  }
}
