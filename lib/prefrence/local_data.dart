import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  final SharedPreferences _sharedPreferences;
  final platform = const MethodChannel("com.youth.neu.flutter");

  LocalData(this._sharedPreferences);

  clearAll() {
    _sharedPreferences.clear();
  }

  /// Returns a [LocalData] object with a [SharedPreferences] instance was set.
  static Future<LocalData> getInstance() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return LocalData(sharedPreferences);
  }

  void saveAccessToken({required String token}) async {
    _sharedPreferences.setString('accessToken', token);
  }

  Future<String?> getAccessToken() async {
    try {
      final token = _sharedPreferences.getString('accessToken') ??
          await platform.invokeMethod('getAccessToken');
      return token;
    } catch (e) {
      return null;
    }
  }

  Future<String> getDeviceId() async {
    try {
      return await platform.invokeMethod('getDeviceId') as String;
    } catch (e) {
      return '';
    }
  }

  void saveUserId({required int userId}) async {
    _sharedPreferences.setInt('userId', userId);
  }

  Future<int?> getUserId() async {
    try {
      final userId = _sharedPreferences.getInt('userId') ??
          await platform.invokeMethod('getUserId');
      return userId;
    } catch (e) {
      return null;
    }
  }

  void saveBiometricsKey({required String key}) async {
    _sharedPreferences.setString("biometricsKey", key);
  }

  void removeBiometricKey() async {
    _sharedPreferences.remove("biometricsKey");
  }

  Future<String?> getBiometricsKey() async {
    return _sharedPreferences.getString("biometricsKey");
  }
}
