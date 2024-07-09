import 'package:genie/utils/token.dart';
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
    Token.token = token; // Update the Token class
  }

  Future<String?> getToken() async {
    await _init();
    String? token = _prefs?.getString(_key);
    Token.token = token ?? ''; // Update the Token class
    return token;
  }

  Future<void> clearToken() async {
    await _init();
    await _prefs?.remove(_key);
    Token.token = ''; // Clear the Token class
  }
}

final TokenService tokenService = TokenService();
