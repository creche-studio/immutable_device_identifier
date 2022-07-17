import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ImmutableDeviceIdentifier {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('immutable_device_identifier');

  Future<String> getUniqueId() async {
    final uniqueId = await methodChannel.invokeMethod<String>('getUniqueId');

    if (uniqueId == null) {
      throw AssertionError('uniqueId become null unexpectedly.');
    }

    return uniqueId;
  }
}
