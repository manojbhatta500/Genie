import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:genie/utils/key.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class SongRepository {
  Future<Either<bool, String>> generateSong(String prompt) async {
    try {
      final model =
          GenerativeModel(model: 'gemini-1.5-flash', apiKey: ApiKey.key);
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      print('this is my song repository response  ${response.text}');
      return Right(response.text!);
    } catch (e) {
      log(e.toString());
      return const Left(false);
    }
  }
}
