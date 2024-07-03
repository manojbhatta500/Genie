import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:genie/utils/apis.dart';
import 'package:genie/utils/key.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;

class PoetryRepository {
  Future<Either<bool, String>> generatePoem(String prompt) async {
    try {
      final model =
          GenerativeModel(model: 'gemini-1.5-flash', apiKey: ApiKey.key);
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      print('this is my poetry repository response  ${response.text}');
      return Right(response.text!);
    } catch (e) {
      log(e.toString());
      return const Left(false);
    }
  }
}
