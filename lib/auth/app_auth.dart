import 'package:shared_preferences/shared_preferences.dart';

Future<void> addToken(String token, DateTime date) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await Future.wait([
    prefs.setString('token', token),
    prefs.setString('date', date.toString()),
  ]);
}

Future<void> removeToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await Future.wait([
    prefs.remove('token'),
    prefs.remove('date'),
  ]);
}

Future<bool> isTokenExpired() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  final date = prefs.getString('date');
  if (token == null || date == null) {
    return true;
  }
  final DateTime tokenDate = DateTime.parse(date);
  final DateTime now = DateTime.now();
  return now.isAfter(tokenDate);
}
