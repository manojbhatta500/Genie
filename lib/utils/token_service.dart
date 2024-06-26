import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String _key = 'token';

  SharedPreferences? _prefs;

  Future<void> _init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> saveToken(String token) async {
    await _init();
    await _prefs?.setString(_key, token);
  }

  Future<String?> getToken() async {
    await _init();
    return _prefs?.getString(_key);
  }

  Future<void> clearToken() async {
    await _init();
    _prefs?.remove(_key);
  }
}

final TokenService tokenService = TokenService();
