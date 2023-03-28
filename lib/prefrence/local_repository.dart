import 'package:neu_app/prefrence/local_data.dart';

class LocalRepository {
  /// Remove all data in local storage
  /// This method is called when user logs out
  /// or when user changes account
  Future<void> clearAllData() async {
    var localData = await LocalData.getInstance();
    return localData.clearAll();
  }

  Future<String?> getAccessToken() async {
    var localData = await LocalData.getInstance();
    return localData.getAccessToken();
  }

  Future<int?> getUserId() async {
    var localData = await LocalData.getInstance();
    return localData.getUserId();
  }

  Future<void> saveBiometricsKey({required String key}) async {
    final localData = await LocalData.getInstance();
    return localData.saveBiometricsKey(key: key);
  }

  Future<void> removeBiometricKey() async {
    final localData = await LocalData.getInstance();
    localData.removeBiometricKey();
  }

  Future<String?> getBiometricsKey() async {
    final localData = await LocalData.getInstance();
    return localData.getBiometricsKey();
  }

  Future<String> getDeviceId() async {
    final localData = await LocalData.getInstance();
    return localData.getDeviceId();
  }
}
