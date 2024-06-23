import 'dart:convert';
import 'dart:developer';
import 'package:genie/utils/apis.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<int> signUp(String userName, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(Apis.signupApi),
        body: jsonEncode({
          "username": userName,
          "userMail": email,
          "userPassword": password
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());
        return 1;
      } else {
        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());
        return 0;
      }
    } catch (e) {
      log('Failed to post data: $e');
      return 0;
    }
  }

  Future<int> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(Apis.signupApi),
        body: jsonEncode({"userMail": email, "userPassword": password}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());
        return 1;
      } else {
        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());
        return 0;
      }
    } catch (e) {
      log('Failed to post data: $e');
      return 0;
    }
  }
}
