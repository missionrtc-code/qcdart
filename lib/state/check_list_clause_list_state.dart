class CheckListClauseListState {
  static final CheckListClauseListState initial = CheckListClauseListState._internal();
  factory CheckListClauseListState() => initial;

  List<TableRowData> _tableRowData = [];

  CheckListClauseListState._internal(){
    _tableRowData = [
      TableRowData(
        clause: 'Clause 1',
        subClause: 'Sub Clause 1',
        clauseDetails: 'Clause Details 1',
        helpTopic: 'Help Topic 1',
        clauseCategory: 'Clause Category 1',
        rating: 'Rating 1',
        riskLevel: 'Risk Level 1',
      ),
      TableRowData(
        clause: 'Clause 2',
        subClause: 'Sub Clause 2',
        clauseDetails: 'Clause Details 2',
        helpTopic: 'Help Topic 2',
        clauseCategory: 'Clause Category 2',
        rating: 'Rating 2',
        riskLevel: 'Risk Level 2',
      ),
      TableRowData(
        clause: 'Clause 3',
        subClause: 'Sub Clause 3',
        clauseDetails: 'Clause Details 3',
        helpTopic: 'Help Topic 3',
        clauseCategory: 'Clause Category 3',
        rating: 'Rating 3',
        riskLevel: 'Risk Level 3',
      ),
    ];
  }

  addTableRowData(TableRowData data) {
    _tableRowData.add(data);
  }

  deleteTableRowData(int index) {
    _tableRowData.removeAt(index);
  }

  List<TableRowData> get tableRowData => _tableRowData;
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