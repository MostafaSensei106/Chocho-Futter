import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../constants/pref_keys.dart';
import '../shared_prefs/secure_storage_service.dart';
import 'interface/base_device_id_service.dart';

@LazySingleton(as: BaseDeviceIdService)
final class DeviceIdService implements BaseDeviceIdService {
  DeviceIdService(this._secureStorage);

  final SecureStorageService _secureStorage;
  final _uuid = const Uuid();

  @override
  Future<String> getDeviceId() async {
    // Try to get existing ID from secure storage
    final storedId = await _secureStorage.getData<String>(
      key: PrefKeys.deviceId,
    );

    if (storedId != null && storedId.isNotEmpty) {
      return storedId;
    }

    // Generate new unique ID if none exists
    final newId = _uuid.v4();

    // Store it securely for future use
    await _secureStorage.setData<String>(key: PrefKeys.deviceId, value: newId);

    return newId;
  }
}
