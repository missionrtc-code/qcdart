import 'package:flutter/material.dart';

class ManagePlantState extends ChangeNotifier {
  // ------------------------------
  // Plant Management
  // ------------------------------
  List<Plant> _list = [
    Plant(
      orgName: 'Org Name',
      orgId: 'Org ID',
      plantName: 'Plant Name',
      plantId: 'Plant ID',
      plantType: 'Plant Type',
      email: 'Email',
      mobile: 'Mobile',
      country: 'Country',
      state: 'State',
      city: 'City',
      pincode: 'Pincode',
      contactName: 'Contact Name',
      address: 'Address',
      dateOfLastUpdate: 'Date of Last Update',
      updatedBy: 'Updated By',
    ),
  ];

  void addPlant(Plant plant) {
    _list.add(plant);
    notifyListeners();
  }

  void removePlant(Plant plant) {
    _list.remove(plant);
    notifyListeners();
  }

  List<Plant> get list => _list;
  set list(List<Plant> value) {
    _list = value;
    notifyListeners();
  }

  // ------------------------------
  // Plant Management Form
  // ------------------------------
  String _orgName = '';
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

  get orgName => _orgName;
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

  set orgName(value) {
    _orgName = value;
    notifyListeners();
  }

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

  void clearPlantForm() {
    _orgName = '';
    _orgId = '';
    _plantName = '';
    _plantId = '';
    _plantType = '';
    _email = '';
    _mobile = '';
    _country = '';
    _state = '';
    _city = '';
    _pincode = '';
    _contactName = '';
    _address = '';
    notifyListeners();
  }

  void setPlantForm(Plant plant) {
    _orgName = plant.orgName;
    _orgId = plant.orgId;
    _plantName = plant.plantName;
    _plantId = plant.plantId;
    _plantType = plant.plantType;
    _email = plant.email;
    _mobile = plant.mobile;
    _country = plant.country;
    _state = plant.state;
    _city = plant.city;
    _pincode = plant.pincode;
    _contactName = plant.contactName;
    _address = plant.address;
    notifyListeners();
  }
}

class Plant {
  final String orgName;
  final String orgId;
  final String plantName;
  final String plantId;
  final String plantType;
  final String email;
  final String mobile;
  final String country;
  final String state;
  final String city;
  final String pincode;
  final String contactName;
  final String address;
  final String dateOfLastUpdate;
  final String updatedBy;

  Plant({
    required this.orgName,
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
    required this.dateOfLastUpdate,
    required this.updatedBy,
  });
}
