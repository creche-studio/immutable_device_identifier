package studio.creche.immutable_device_identifier

import android.media.MediaDrm
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import java.util.UUID

/** ImmutableDeviceIdentifierPlugin */
class ImmutableDeviceIdentifierPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "immutable_device_identifier")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getUniqueId") {
      // generate UUID and return it
      val uuid = UUID.fromString("edef8ba9-79d6-4ace-a3c8-27dcd51d21ed")
      val id = MediaDrm(uuid).getPropertyByteArray(MediaDrm.PROPERTY_DEVICE_UNIQUE_ID)
      val uniqueId = id.joinToString(":") { String.format("%02X", it) }

      result.success(uniqueId)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
