class CheckListState {
  static final CheckListState _instance = CheckListState._internal();
  factory CheckListState() => _instance;

  // Properties
  List<Checklist> _checklist = [];

  CheckListState._internal(){
    _checklist = [
      Checklist(id: 1, checklist: 'Checklist 1', lastUpdate: 'Checklist 1', updatedBy: 'Checklist 1'),
    ];
  }

  List<Checklist> get checklist => _checklist;
}

class Checklist {
  final int id;
  final String checklist;
  final String lastUpdate;
  final String updatedBy;

  Checklist({required this.id, required this.checklist, required this.lastUpdate, required this.updatedBy});
}