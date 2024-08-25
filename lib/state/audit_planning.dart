import 'package:flutter/material.dart';

class AuditPlanningState extends ChangeNotifier {
  List<AuditPlan> _list = [
    AuditPlan(
      plantName: 'Plant 1',
      auditType: 'Type 1',
      auditDateTime: '2022-01-01',
    ),
    AuditPlan(
      plantName: 'Plant 2',
      auditType: 'Type 2',
      auditDateTime: '2022-01-01',
    ),
  ];

  void addAuditPlan(AuditPlan auditPlan) {
    _list.add(auditPlan);
    notifyListeners();
  }

  void removeAuditPlan(AuditPlan auditPlan) {
    _list.remove(auditPlan);
    notifyListeners();
  }

  void updateAuditPlan(AuditPlan auditPlan) {
    final index = _list.indexWhere((element) => element.plantName == auditPlan.plantName);
    _list[index] = auditPlan;
    notifyListeners();
  }

  List<AuditPlan> get list => _list;
  set list(List<AuditPlan> value) {
    _list = value;
    notifyListeners();
  }
}

class AuditPlan {
  final String plantName;
  final String auditType;
  final String auditDateTime;
  AuditPlan({
    required this.plantName,
    required this.auditType,
    required this.auditDateTime,
  });
}