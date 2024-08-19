import 'package:flutter/foundation.dart';

class RegisterState extends ChangeNotifier {
  int _selectedTabIndex = 0;
  String fname = "";
  String lname = "";
  String email = "";
  String phone = '';
  String password = "";
  String orgName = "";
  String country = "";
  String state = ""; 
  String city = ""; 
  String pincode = ""; 
  String address = "";

  void setFname(String value) {
    fname = value;
    notifyListeners();
  }

  void setLname(String value) {
    lname = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPhone(String value) {
    phone = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setOrgName(String value) {
    orgName = value;
    notifyListeners();
  }

  void setCountry(String value) {
    country = value;
    notifyListeners();
  }

  void setState(String value) {
    state = value;
    notifyListeners();
  }

  void setCity(String value) {
    city = value;
    notifyListeners();
  }

  void setPincode(String value) {
    pincode = value;
    notifyListeners();
  }

  void setAddress(String value) {
    address = value;
    notifyListeners();
  }

  void next() {
    _selectedTabIndex++;
    notifyListeners();
  }

  void back() {
    _selectedTabIndex--;
    notifyListeners();
  }

  void reset() {
    _selectedTabIndex = 1;
    fname = '';
    lname = '';
    email = '';
    phone = '';
    notifyListeners();
  }

  // Getter
  int get selectedTabIndex => _selectedTabIndex;
}
