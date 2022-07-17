# immutable_device_identifier

It supply device identifier for iOS / Android device.  
(That identifier does not change per installation)

## Usage
```
  final uniqueId = ImmutableDeviceIdentifier().getUniqueId();
```

## iOS
Swift code is as below.  
By using UUID and Keychain, it assure the return value immutability per re-installation.

```
  let key = "studio.creche.immutable_device_identifier/unique_id"

  var uuid = try? self.keychain.get(key)
  if (uuid ?? "").isEmpty {
    uuid = UUID().uuidString
    try? self.keychain.set(uuid ?? "", key: key)
  }
```


## Android
Kotlin code is as below.  
By using MediaDrm, it assure the return value immutability per re-installation.

```
  val uuid = UUID.fromString("edef8ba9-79d6-4ace-a3c8-27dcd51d21ed")
  val id = MediaDrm(uuid).getPropertyByteArray(MediaDrm.PROPERTY_DEVICE_UNIQUE_ID)
  val uniqueId = id.joinToString(":") { String.format("%02X", it) }
```
