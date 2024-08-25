import 'package:flutter/material.dart';

class ManagePlantsState extends ChangeNotifier {
  List<Plants> _list = [
    Plants(
      plantName: 'Plant 1',
      plantType: ['Type 1', 'Type 2'],
      dateOfLastUpdate: '2022-01-01',
      updatedBy: 'Admin',
    ),
    Plants(
      plantName: 'Plant 2',
      plantType: ['Type 1', 'Type 2'],
      dateOfLastUpdate: '2022-01-01',
      updatedBy: 'Admin',
    ),
  ];
  String _plantName = '';
  
  String get plantName => _plantName;
  set plantName(String value) {
    _plantName = value;
    notifyListeners();
  }

  void addPlant(Plants plant) {
    _list.add(plant);
    notifyListeners();
  }

  void removePlant(Plants plant) {
    _list.remove(plant);
    notifyListeners();
  }

  List<Plants> get list => _list;
  set list(List<Plants> value) {
    _list = value;
    notifyListeners();
  }
}

class Plants {
  final String plantName;
  final List<String> plantType;
  final String dateOfLastUpdate;
  final String updatedBy;  

  Plants({
    required this.plantName,
    required this.plantType,
    required this.dateOfLastUpdate,
    required this.updatedBy,
  });
}
