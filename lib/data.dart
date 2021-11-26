import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static late SharedPreferences _preferences;

  static Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static const _accessToken = 'AccessToken';

  Future<void> setAccessToken(String token) async {
    await _preferences.setString(_accessToken, token);
  }

  String getAccessToken() {
    return _preferences.getString(_accessToken) ?? '';
  }
}
