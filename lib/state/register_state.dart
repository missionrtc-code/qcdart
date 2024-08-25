import 'package:flutter/foundation.dart';

class RegisterState extends ChangeNotifier {
  int _selectedTabIndex = 0;
  String fname = "Shubham";
  String lname = "Kumar";
  String email = "kumar@rareworks.io";
  String phone = '9390320345';
  String password = "0000000000";
  String orgName = "00000000000";
  String country = "";
  String state = ""; 
  String city = ""; 
  String pincode = "411057"; 
  String address = "Pune 411057";

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
    _selectedTabIndex = 0;
    // fname = '';
    // lname = '';
    // email = '';
    // phone = '';
    notifyListeners();
  }

  // Getter
  int get selectedTabIndex => _selectedTabIndex;
}
