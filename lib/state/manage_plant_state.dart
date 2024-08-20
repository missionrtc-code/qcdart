import 'package:flutter/material.dart';

class ManagePlantState extends ChangeNotifier {
  //-------------------
  // List of plants
  //-------------------
  List<Plant> _list = [
    Plant(
        orgId: 'orgId 1',
        plantName: 'Plant name 1',
        plantId: 'Plant id 1',
        plantType: 'Type 1',
        email: 'email 1',
        mobile: 'mobile 1',
        country: 'country 1',
        city: 'city 1',
        pincode: 'pincode 1',
        contactName: 'contact name 1',
        address: 'address 1')
  ];
  get list => _list;
  set list(value) {
    _list = value;
    notifyListeners();
  }

  void addPlant(Plant plant) {
    _list.add(plant);
    notifyListeners();
  }

  void removePlant(Plant plant) {
    _list.remove(plant);
    notifyListeners();
  }

  //-------------------
  // Plant form
  //-------------------

  String _orgId = '';
  String _plantName = '';
  String _plantId = '';
  String _plantType = '';
  String _email = '';
  String _mobile = '';
  String _country = '';
  String _city = '';
  String _pincode = '';
  String _contactName = '';
  String _address = '';

  get orgId => _orgId;
  get plantName => _plantName;
  get plantId => _plantId;
  get plantType => _plantType;
  get email => _email;
  get mobile => _mobile;
  get country => _country;
  get city => _city;
  get pincode => _pincode;
  get contactName => _contactName;
  get address => _address;

  set orgId(value) {
    _orgId = value;
    notifyListeners();
  }

  set plantName(value) {
    _plantName = value;
    notifyListeners();
  }

  set plantId(value) {
    _plantId = value;
    notifyListeners();
  }

  set plantType(value) {
    _plantType = value;
    notifyListeners();
  }

  set email(value) {
    _email = value;
    notifyListeners();
  }

  set mobile(value) {
    _mobile = value;
    notifyListeners();
  }

  set country(value) {
    _country = value;
    notifyListeners();
  }

  set city(value) {
    _city = value;
    notifyListeners();
  }

  set pincode(value) {
    _pincode = value;
    notifyListeners();
  }

  set contactName(value) {
    _contactName = value;
    notifyListeners();
  }

  set address(value) {
    _address = value;
    notifyListeners();
  }
}

class Plant {
  String orgId;
  String plantName;
  String plantId;
  String plantType;
  String email;
  String mobile;
  String country;
  String city;
  String pincode;
  String contactName;
  String address;
  Plant({
    required this.orgId,
    required this.plantName,
    required this.plantId,
    required this.plantType,
    required this.email,
    required this.mobile,
    required this.country,
    required this.city,
    required this.pincode,
    required this.contactName,
    required this.address,
  });
}
