import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isTokenExpired() async {
  final prefs = await SharedPreferences.getInstance();
  final expiryTimeString = prefs.getString('expiryTime');

  if (expiryTimeString == null) {
    // No expiry time found, consider the token expired
    return true;
  }

  final expiryTime = DateTime.parse(expiryTimeString);
  final currentTime = DateTime.now();
  
  return currentTime.isAfter(expiryTime);  
}
