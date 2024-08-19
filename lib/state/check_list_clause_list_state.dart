import 'package:flutter/material.dart';

class CheckListClauseListState extends ChangeNotifier {
  final List<TableRowData> _tableRowData = [];

  List<TableRowData> get tableRowData => _tableRowData;

  String _checkListName = '';
  String _clause = '';
  String _subClause = '';
  String _clauseDetails = '';
  String _helpTopic = '';
  String _clauseCategory = '';
  String _rating = '';
  String _riskLevel = '';

  set setCheckListName(String value) {
    _checkListName = value;
    notifyListeners();
  }

  set setClause(String value) {
    _clause = value;
    notifyListeners();
  }

  set setSubClause(String value) {
    _subClause = value;
    notifyListeners();
  }

  set setClauseDetails(String value) {
    _clauseDetails = value;
    notifyListeners();
  }

  set setHelpTopic(String value) {
    _helpTopic = value;
    notifyListeners();
  }

  set setClauseCategory(String value) {
    _clauseCategory = value;
    notifyListeners();
  }

  set setRating(String value) {
    _rating = value;
    notifyListeners();
  }

  set setRiskLevel(String value) {
    _riskLevel = value;
    notifyListeners();
  }

  get getCheckListName => _checkListName;
  get getClause => _clause;
  get getSubClause => _subClause;
  get getClauseDetails => _clauseDetails;
  get getHelpTopic => _helpTopic;
  get getClauseCategory => _clauseCategory;
  get getRating => _rating;
  get getRiskLevel => _riskLevel;

  void addTableRowData(TableRowData data) {
    _tableRowData.add(data);
    notifyListeners();
  }

  void removeTableRowData(TableRowData data) {
    _tableRowData.remove(data);
    notifyListeners();
  }

  void reset() {
    _clause = '';
    notifyListeners();
  }
}

class TableRowData {
  final String clause;
  final String subClause;
  final String clauseDetails;
  final String helpTopic;
  final String clauseCategory;
  final String rating;
  final String riskLevel;

  TableRowData({
    required this.clause,
    required this.subClause,
    required this.clauseDetails,
    required this.helpTopic,
    required this.clauseCategory,
    required this.rating,
    required this.riskLevel,
  });
}