import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'immutable_device_identifier_platform_interface.dart';

/// An implementation of [ImmutableDeviceIdentifierPlatform] that uses method channels.
class MethodChannelImmutableDeviceIdentifier extends ImmutableDeviceIdentifierPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('immutable_device_identifier');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
