#import "ImmutableDeviceIdentifierPlugin.h"
#if __has_include(<immutable_device_identifier/immutable_device_identifier-Swift.h>)
#import <immutable_device_identifier/immutable_device_identifier-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "immutable_device_identifier-Swift.h"
#endif

@implementation ImmutableDeviceIdentifierPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImmutableDeviceIdentifierPlugin registerWithRegistrar:registrar];
}
@end
