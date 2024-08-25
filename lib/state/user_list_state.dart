import 'package:flutter/material.dart';

class UserListState extends ChangeNotifier {
  // ------------------------------
  // User List State
  // ------------------------------
  List<User> _list = [
    User(
      id: '1',
      name: 'John Doe',
      updatedBy: 'Admin',
      dateOfLastUpdate: '2022-01-01',
    ),
    User(
      id: '2',
      name: 'Jane Doe',
      updatedBy: 'Admin',
      dateOfLastUpdate: '2022-01-01',
    ),
  ];

  List<User> get list => _list;
  set list(List<User> value) {
    _list = value;
    notifyListeners();
  }

  void addUser(User user) {
    _list.add(user);
    notifyListeners();
  }

  void removeUser(User user) {
    _list.remove(user);
    notifyListeners();
  }

  void updateUser(User user) {
    var index = _list.indexWhere((element) => element.name == user.name);
    _list[index] = user;
    notifyListeners();
  }

  void clearUser() {
    _list.clear();
    notifyListeners();
  }

  String _username = "";
  String get username => _username;
  set username(String value) {
    _username = value;
    notifyListeners();
  }
}

class User {
  final String id;
  final String name;
  final String updatedBy;
  final String dateOfLastUpdate;

  User({
    required this.id,
    required this.name,
    required this.updatedBy,
    required this.dateOfLastUpdate,
  });
}