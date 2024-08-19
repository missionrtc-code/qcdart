class CheckListState {
  List<Checklist> _checklist = [];

  set checklist(List<Checklist> value) => _checklist = value;
  List<Checklist> get checklist => _checklist;
}

class Checklist {
  final int id;
  final String checklist;
  final String lastUpdate;
  final String updatedBy;

  Checklist({required this.id, required this.checklist, required this.lastUpdate, required this.updatedBy});
}