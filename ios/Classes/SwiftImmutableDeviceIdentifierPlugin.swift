import Flutter
import UIKit
import KeychainAccess

public class SwiftImmutableDeviceIdentifierPlugin: NSObject, FlutterPlugin {

    let keychain = Keychain(service: "studio.creche.immutable_device_identifier")

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "immutable_device_identifier", binaryMessenger: registrar.messenger())
        let instance = SwiftImmutableDeviceIdentifierPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getUniqueId":
            let key = "studio.creche.immutable_device_identifier/unique_id"

            var uuid = try? self.keychain.get(key)
            if (uuid ?? "").isEmpty {
                uuid = UUID().uuidString
                try? self.keychain.set(uuid ?? "", key: key)
            }

            result(uuid)

        default:
            result(FlutterMethodNotImplemented)
            fatalError()
        }
    }
}
