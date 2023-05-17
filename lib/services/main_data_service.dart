import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/strings/paths.dart';

class MainDataService {
  static Future<dynamic> _getResponse(http.Response response) async {
    if (response.statusCode == 200) {
      //final jsonResponse = jsonDecode(response.body);
      final utf8Response = utf8.decode(response.bodyBytes);
      final jsonResponse = json.decode(utf8Response);

      if (jsonResponse['success']) {
        return jsonResponse['data'];
      } else {
        throw Exception(jsonResponse['error']);
      }
    } else {
      throw Exception('Something went wrong status: ${response.statusCode}');
    }
  }

  static Future<dynamic> get(String path) async {
    final response = await http.get(Uri.parse('${Paths.baseUrl}/$path'));
    return _getResponse(response);
  }

  static Future<dynamic> post(String path, dynamic data) async {
    final response = await http.post(
      Uri.parse('${Paths.baseUrl}/$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return _getResponse(response);
  }

  static Future<dynamic> put(String path, dynamic data) async {
    final response = await http.put(
      Uri.parse('${Paths.baseUrl}/$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return _getResponse(response);
  }

  static Future<dynamic> delete(String path) async {
    final response = await http.delete(Uri.parse('${Paths.baseUrl}/$path'));
    return _getResponse(response);
  }
}
