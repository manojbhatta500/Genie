import 'dart:convert';
import 'dart:developer';

import 'package:genie/utils/apis.dart';
import 'package:genie/utils/token.dart';
import 'package:http/http.dart' as http;

class SaveContentRepository {
  Future<bool> saveContent(
      {required String title,
      required String content,
      required String type}) async {
    log('district repository running');
    final response = await http.post(
      Uri.parse(Apis.saveContent),
      body: jsonEncode({"title": title, "content": content, "type": type}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Token.token}',
      },
    );
    log('${Token.token}');
    log('save content repository save content method running');
    try {
      log('save content repository running try');
      if (response.statusCode == 200) {
        final responseJson = response.body;
        log('this is try statement form if status code 200 ');
        log(responseJson);
        return true;
      } else {
        log('this is try statement form else status code 200 ');
        return false;
      }
    } catch (e) {
      log('catch statement from server ${response.body}');
      log('Error: $e');
      return false;
    }
  }
}
