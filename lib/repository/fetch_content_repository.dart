import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:genie/models/content_model.dart';
import 'package:genie/utils/apis.dart';
import 'package:genie/utils/token.dart';
import 'package:http/http.dart' as http;

class FetchContentRepository {
  Future<Either<bool, ContentModel>> fetchContent() async {
    log('fetchCOntent repository running');
    final response = await http.get(
      Uri.parse(Apis.saveContent),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Token.token}',
      },
    );
    log('${Token.token}');
    log('fetch content repository save content method running');
    try {
      log('fetch content repository running try');
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        log('this is try statement form if status code 200 ');
        final data = ContentModel.fromJson(responseJson);
        return Right(data);
      } else {
        log('this is try statement form else status code 200 ');
        return Left(false);
      }
    } catch (e) {
      log('catch statement from server ${response.body}');
      log('Error: $e');
      return Left(false);
    }
  }
}
