import 'package:flutter/material.dart';

class ManagePlantState extends ChangeNotifier {
  //-------------------
  // List of plants
  //-------------------
  List<Plant> _list = [
    Plant(
      orgId: '1',
      plantName: 'Plant 1',
      plantId: '1',
      plantType: 'Type 1',
      email: 'email;@example.com',
      mobile: '1234567890',
      country: 'India',
      state: 'State 1',
      city: 'City 1',
      pincode: '123456',
      contactName: 'Contact Name 1',
      address: 'Address 1',
    ),
  ];
  get list => _list;
  set list(value) {
    _list = value;
    notifyListeners();
  }

  void addPlant() {
    _list.add(Plant(
        orgId: orgId,
        plantName: plantName,
        plantId: plantId,
        plantType: plantType,
        email: email,
        mobile: mobile,
        country: country,
        state: state,
        city: city,
        pincode: pincode,
        contactName: contactName,
        address: address));
    notifyListeners();
    resetForm();
  }

  void removePlant(Plant plant) {
    _list.remove(plant);
    notifyListeners();
  }

  void resetForm() {
    orgId = '';
    plantType = '';
    email = '';
    mobile = '';
    country = '';
    state = '';
    city = '';
    pincode = '';
    contactName = '';
    address = '';
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
  String _state = '';
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
  get state => _state;
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

  set state(value) {
    _state = value;
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
  String state;
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
    required this.state,
    required this.city,
    required this.pincode,
    required this.contactName,
    required this.address,
  });
}
