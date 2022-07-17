import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'immutable_device_identifier_method_channel.dart';

abstract class ImmutableDeviceIdentifierPlatform extends PlatformInterface {
  /// Constructs a ImmutableDeviceIdentifierPlatform.
  ImmutableDeviceIdentifierPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImmutableDeviceIdentifierPlatform _instance = MethodChannelImmutableDeviceIdentifier();

  /// The default instance of [ImmutableDeviceIdentifierPlatform] to use.
  ///
  /// Defaults to [MethodChannelImmutableDeviceIdentifier].
  static ImmutableDeviceIdentifierPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImmutableDeviceIdentifierPlatform] when
  /// they register themselves.
  static set instance(ImmutableDeviceIdentifierPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
