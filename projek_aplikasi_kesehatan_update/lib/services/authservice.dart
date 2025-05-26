import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'http:// 192.168.100.17/projekkesehatan'; // Ganti IP sesuai PC mu

  Future<String> registerUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/register.php');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);
    return data['message'];
  }

  Future<String> loginUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/login.php');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);
    return data['message'];
  }
}
