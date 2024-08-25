import 'package:flutter/material.dart';

class AuditPlanningDetailState extends ChangeNotifier {

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

  String _startAuditDateTime = '';
  String _endAuditDateTime = '';

  String get plantName => _plantName;
  String get auditType => _auditType;
  String get auditorsType_1 => _auditorsType_1;
  String get auditorsType_2 => _auditorsType_2;
  String get auditorsName_1 => _auditorsName_1;
  String get auditorsName_2 => _auditorsName_2;
  String get auditees_1 => _auditees_1;
  String get auditees_2 => _auditees_2;

  String get startAuditDateTime => _startAuditDateTime;
  String get endAuditDateTime => _endAuditDateTime;

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

  set startAuditDateTime(String value) {
    _startAuditDateTime = value;
    notifyListeners();
  }

  set endAuditDateTime(String value) {
    _endAuditDateTime = value;
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

    _startAuditDateTime = '';
    _endAuditDateTime = '';
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
    _startAuditDateTime = auditPlan.startAuditDateTime;
    _endAuditDateTime = auditPlan.endAuditDateTime;
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

  final String startAuditDateTime;
  final String endAuditDateTime;

  AuditPlan({
    required this.plantName,
    required this.auditType,

    required this.auditorsType_1,
    required this.auditorsType_2,

    required this.auditorsName_1,
    required this.auditorsName_2,

    required this.auditees_1,
    required this.auditees_2,

    required this.startAuditDateTime,
    required this.endAuditDateTime,
  });
}