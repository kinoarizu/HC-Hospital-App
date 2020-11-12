part of 'utils.dart';

class SharedPreferenceUtil {
  static Future<void> setPreference(String key, value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(key, jsonEncode(value));
  }

  static Future<String> getPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
  }

  static Future<bool> checkPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(key);
  }
}