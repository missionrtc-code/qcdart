import 'package:flutter/foundation.dart';

class UserDetailState extends ChangeNotifier {
  String _id = '';
  String _name = '';
  String _fname = '';
  String _lname = '';
  String _email = '';
  String _phone = '';
  String _role = '';
  List<String> _plantMapping = [];

  String get id => _id;
  String get name => _name;
  String get fname => _fname;
  String get lname => _lname;
  String get email => _email;
  String get phone => _phone;
  String get role => _role;
  List<String> get plantMapping => _plantMapping;

  set id(String value) {
    _id = value;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set fname(String value) {
    _fname = value;
    notifyListeners();
  }

  set lname(String value) {
    _lname = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set phone(String value) {
    _phone = value;
    notifyListeners();
  }

  set role(String value) {
    _role = value;
    notifyListeners();
  }

  set plantMapping(List<String> value) {
    _plantMapping = value;
    notifyListeners();
  }

  void clearUser() {
    _id = '';
    _name = '';
    _fname = '';
    _lname = '';
    _email = '';
    _phone = '';
    _role = '';
    _plantMapping = [];
    notifyListeners();
  }

  void setUser(User user) {
    _id = user.id;
    _name = user.name;
    _fname = user.fname;
    _lname = user.lname;
    _email = user.email;
    _phone = user.phone;
    _role = user.role;
    _plantMapping = user.plantMapping;
    notifyListeners();
  }
}

class User {
  final String id;
  final String name;
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final String role;
  final List<String> plantMapping;

  User({
    required this.id,
    required this.name,
    required this.fname,
    required this.lname,
    required this.email,
    required this.phone,
    required this.role,
    required this.plantMapping,
  });
}