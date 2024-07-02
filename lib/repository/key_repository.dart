import 'dart:convert';
import 'dart:developer';

import 'package:genie/models/key_model.dart';
import 'package:genie/utils/apis.dart';
import 'package:genie/utils/key.dart';
import 'package:http/http.dart' as http;

class KeyRepository {
  Future<bool> fetchGeminiKey() async {
    try {
      final response = await http.get(
        Uri.parse(Apis.geminiKey),
      );
      log('response statuscode = ${response.statusCode}');
      log('response body : ${response.body}');
      if (response.statusCode == 200) {
        final data = KeyModel.fromJson(jsonDecode(response.body));
        ApiKey.key = data.key!;
        log(' key is : ${data.key!}');
        log('APi key class key is : ${ApiKey.key}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('hello world');
    }
  }
}
