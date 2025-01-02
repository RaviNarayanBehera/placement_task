import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String usersUrl = 'https://dummyjson.com/users';
  static const String authUrl = 'https://dummyjson.com/auth/login';

  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse(usersUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['users'];
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map<String, dynamic>> authenticateUser(String username, String password) async {
    final response = await http.post(
      Uri.parse(authUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Invalid credentials');
    }
  }
}