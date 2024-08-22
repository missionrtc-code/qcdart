import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qcdart/lib/host.dart';

FutureOr<String?> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {
        'content-type': 'application/x-www-form-urlencoded',
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['token'];
    } else {
      print('Failed to login: ${response.statusCode}');
    }
  } catch (e) {
    print('Error during login: $e');
  }
  return null;
}