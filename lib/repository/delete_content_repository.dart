import 'dart:convert';
import 'dart:developer';
import 'package:genie/utils/apis.dart';
import 'package:genie/utils/token.dart';
import 'package:http/http.dart' as http;

class DeleteContentRepository {
  Future<bool> deleteContent(String id) async {
    log('DeleteContent repository running');

    final url = Uri.parse('${Apis.saveContent}/$id');
    log('Deleting content with URL: $url');

    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Token.token}',
      },
    );

    log('Token used: ${Token.token}');
    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');

    try {
      if (response.statusCode == 200) {
        log('Successfully deleted');
        return true;
      } else if (response.statusCode == 404) {
        log('Content not found');
        return false;
      } else {
        log('Failed to delete content with status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log('Error: $e');
      return false;
    }
  }
}
