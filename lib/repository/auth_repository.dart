import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:genie/models/login_model.dart';
import 'package:genie/utils/apis.dart';
import 'package:genie/utils/token.dart';
import 'package:genie/utils/token_service.dart';
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

  Future<Either<int, LoginModel>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(Apis.loginApi),
        body: jsonEncode({"userMail": email, "userPassword": password}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());
        final modelData = LoginModel.fromJson(jsonResponse);
        Token.token = modelData.token!;
        // pass input from the event and if user asks for save
        // then save and other
        if (Token.token != '') {
          log('this is token class ${Token.token}');
          await tokenService.saveToken(Token.token);

          // Use the global instance to get a token
          String? token = await tokenService.getToken();
          log('this is locally saved : $token');
        } else {
          log('we are running empty else list here ');
        }
        return Right(modelData);
      } else {
        final jsonResponse = jsonDecode(response.body);
        log(jsonResponse.toString());
        return left(0);
      }
    } catch (e) {
      log('Failed to post data: $e');
      return left(0);
    }
  }
}
