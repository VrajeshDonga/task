import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:task/model/user_model.dart';

class ApiService {
  static const String apiUrl = 'http://151.106.113.31:5000/api/customers';

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return User.fromJson(jsonData);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
