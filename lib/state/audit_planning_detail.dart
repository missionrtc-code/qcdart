import 'package:flutter/material.dart';

class AuditPlanningDetailState extends ChangeNotifier {
  // ------------------------------
  // Audit Planning Detail
  // ------------------------------
  List<AuditPlan> _list = [
    AuditPlan(
      plantName: 'Plant 1',
      auditType: 'Internal',

      auditorsType_1: 'Internal',
      auditorsType_2: 'External',

      auditorsName_1: 'Auditor 1',
      auditorsName_2: 'Auditor 2',

      auditees_1: 'Auditee 1',
      auditees_2: 'Auditee 2',

      auditDateTime: '2022-12-31 23:59:59',
    ),
    AuditPlan(
      plantName: 'Plant 2',
      auditType: 'External',

      auditorsType_1: 'Internal',
      auditorsType_2: 'External',

      auditorsName_1: 'Auditor 1',
      auditorsName_2: 'Auditor 2',

      auditees_1: 'Auditee 1',
      auditees_2: 'Auditee 2',

      auditDateTime: '2022-12-31 23:59:59',
    ),
    AuditPlan(
      plantName: 'Plant 3',
      auditType: 'Internal',

      auditorsType_1: 'Internal',
      auditorsType_2: 'External',

      auditorsName_1: 'Auditor 1',
      auditorsName_2: 'Auditor 2',

      auditees_1: 'Auditee 1',
      auditees_2: 'Auditee 2',

      auditDateTime: '2022-12-31 23:59:59',
    ),
  ];

  List<AuditPlan> get list => _list;
  set list(List<AuditPlan> value) {
    _list = value;
    notifyListeners();
  }

  void add(AuditPlan auditPlan) {
    _list.add(auditPlan);
    reset();
    // notifyListeners();
  }

  void remove(AuditPlan auditPlan) {
    _list.remove(auditPlan);
    notifyListeners();
  }

  void update(AuditPlan auditPlan) {
    final index = _list.indexWhere((element) => element.plantName == auditPlan.plantName);
    if (index != -1) {
      _list[index] = auditPlan;
      notifyListeners();
    }
  }

  // ------------------------------
  // Audit Planning Detail Form
  // ------------------------------
  String _plantName = '';
  String _auditType = '';
  String _auditorsType_1 = '';
  String _auditorsType_2 = '';
  String _auditorsName_1 = '';
  String _auditorsName_2 = '';
  String _auditees_1 = '';
  String _auditees_2 = '';
  String _auditDateTime = '';

  String get plantName => _plantName;
  String get auditType => _auditType;
  String get auditorsType_1 => _auditorsType_1;
  String get auditorsType_2 => _auditorsType_2;
  String get auditorsName_1 => _auditorsName_1;
  String get auditorsName_2 => _auditorsName_2;
  String get auditees_1 => _auditees_1;
  String get auditees_2 => _auditees_2;
  String get auditDateTime => _auditDateTime;

  set plantName(String value) {
    _plantName = value;
    notifyListeners();
  }

  set auditType(String value) {
    _auditType = value;
    notifyListeners();
  }

  set auditorsType_1(String value) {
    _auditorsType_1 = value;
    notifyListeners();
  }

  set auditorsType_2(String value) {
    _auditorsType_2 = value;
    notifyListeners();
  }

  set auditorsName_1(String value) {
    _auditorsName_1 = value;
    notifyListeners();
  }

  set auditorsName_2(String value) {
    _auditorsName_2 = value;
    notifyListeners();
  }

  set auditees_1(String value) {
    _auditees_1 = value;
    notifyListeners();
  }

  set auditees_2(String value) {
    _auditees_2 = value;
    notifyListeners();
  }

  set auditDateTime(String value) {
    _auditDateTime = value;
    notifyListeners();
  }

  void reset() {
    _plantName = '';
    _auditType = '';
    _auditorsType_1 = '';
    _auditorsType_2 = '';
    _auditorsName_1 = '';
    _auditorsName_2 = '';
    _auditees_1 = '';
    _auditees_2 = '';
    _auditDateTime = '';
    notifyListeners();
  }

  void setAuditPlan(AuditPlan auditPlan) {
    _plantName = auditPlan.plantName;
    _auditType = auditPlan.auditType;
    _auditorsType_1 = auditPlan.auditorsType_1;
    _auditorsType_2 = auditPlan.auditorsType_2;
    _auditorsName_1 = auditPlan.auditorsName_1;
    _auditorsName_2 = auditPlan.auditorsName_2;
    _auditees_1 = auditPlan.auditees_1;
    _auditees_2 = auditPlan.auditees_2;
    _auditDateTime = auditPlan.auditDateTime;
    notifyListeners();
  }
}

class AuditPlan {
  final String plantName;
  final String auditType;

  final String auditorsType_1;
  final String auditorsType_2;

  final String auditorsName_1;
  final String auditorsName_2;

  final String auditees_1;
  final String auditees_2;

  final String auditDateTime;

  AuditPlan({
    required this.plantName,
    required this.auditType,

    required this.auditorsType_1,
    required this.auditorsType_2,

    required this.auditorsName_1,
    required this.auditorsName_2,

    required this.auditees_1,
    required this.auditees_2,

    required this.auditDateTime,
  });
}