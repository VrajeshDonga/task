import 'dart:convert';

import 'package:task/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = 'http://151.106.113.31:5000/api/customers';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData is List) {
        return jsonData.map((userJson) => User.fromJson(userJson)).toList();
      } else {
        throw Exception('Invalid API response');
      }
    } else {
      throw Exception('Failed to load users');
    }
  }
}