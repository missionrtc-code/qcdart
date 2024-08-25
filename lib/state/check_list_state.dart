class CheckListState {
  List<Checklist> _checklist = [
    Checklist(id: 1, checklist: 'Checklist 1', lastUpdate: '2021-10-01', updatedBy: 'User 1'),
    Checklist(id: 2, checklist: 'Checklist 2', lastUpdate: '2021-10-02', updatedBy: 'User 2'),
    Checklist(id: 3, checklist: 'Checklist 3', lastUpdate: '2021-10-03', updatedBy: 'User 3'),
    Checklist(id: 4, checklist: 'Checklist 4', lastUpdate: '2021-10-04', updatedBy: 'User 4'),
    Checklist(id: 5, checklist: 'Checklist 5', lastUpdate: '2021-10-05', updatedBy: 'User 5'),
    Checklist(id: 6, checklist: 'Checklist 6', lastUpdate: '2021-10-06', updatedBy: 'User 6'),
    Checklist(id: 7, checklist: 'Checklist 7', lastUpdate: '2021-10-07', updatedBy: 'User 7'),
    Checklist(id: 8, checklist: 'Checklist 8', lastUpdate: '2021-10-08', updatedBy: 'User 8'),
    Checklist(id: 9, checklist: 'Checklist 9', lastUpdate: '2021-10-09', updatedBy: 'User 9'),
    Checklist(id: 10, checklist: 'Checklist 10', lastUpdate: '2021-10-10', updatedBy: 'User 10'),
  ];

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