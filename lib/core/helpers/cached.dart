import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    if (sharedPreferences == null) return null;
    return sharedPreferences.get(key);
  }

  static Future<bool> clearData({
    required key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> saveUserId(String userId) async {
    return await sharedPreferences.setString('userId', userId);
  }

  static Future<String?> getUserId() async {
    return sharedPreferences.getString('userId');
  }
}
