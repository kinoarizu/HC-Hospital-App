part of 'utils.dart';

class SharedPreferenceUtil {
  static Future<void> setPreference(String key, value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('user', json.encode(value));
  }

  static Future<Patient> getPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString(key));

    return Patient.fromJson(json);
  }

  static Future<bool> checkPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(key);
  }
}