import 'package:flutter/material.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/state/check_list_state.dart';

class DashboardManageScreen extends StatefulWidget {
  const DashboardManageScreen({super.key});

  @override
  State<DashboardManageScreen> createState() => _DashboardManageScreenState();
}

class _DashboardManageScreenState extends State<DashboardManageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckListState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Manage',
                      style: Theme.of(context).textTheme.headlineMedium),
                  ElevatedButton(
                    onPressed: () {
                      _showCreateDialog(context);
                    },
                    child: Text('Add new checklist'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: CheckListState()
                          .checklist
                          .asMap()
                          .entries
                          .map((entry) {
                        int index = entry.key + 1;
                        Checklist checklist = entry.value;
                        return Card(
                          child: ListTile(
                            title: Text('$index. ${checklist.checklist}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Last update: ${checklist.lastUpdate}'),
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    Text('Updated by: ${checklist.updatedBy}'),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // TODO: Implement edit action
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // TODO: Implement delete action
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )),

              // ListView(
              //   shrinkWrap: true,
              //   children:
              //       CheckListState().checklist.asMap().entries.map((entry) {
              //     int index = entry.key + 1;
              //     Checklist checklist = entry.value;
              //     return Card(
              //       child: ListTile(
              //         title: Text('$index. ${checklist.checklist}'),
              //         subtitle: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text('Last update: ${checklist.lastUpdate}'),
              //             Row(
              //               children: [
              //                 Icon(Icons.person),
              //                 Text('Updated by: ${checklist.updatedBy}'),
              //               ],
              //             ),
              //           ],
              //         ),
              //         trailing: Row(
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             IconButton(
              //               icon: Icon(Icons.edit),
              //               onPressed: () {
              //                 // TODO: Implement edit action
              //               },
              //             ),
              //             IconButton(
              //               icon: Icon(Icons.delete),
              //               onPressed: () {
              //                 // TODO: Implement delete action
              //               },
              //             ),
              //           ],
              //         ),
              //       ),
              //     );
              //   }).toList(),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Checklist'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Enter checklist name'),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // TODO: Implement save action
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/dashboard/manage/edit');
              },
            ),
          ],
        );
      },
    );
  }
}
