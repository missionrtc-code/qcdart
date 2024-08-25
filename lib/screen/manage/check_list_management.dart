import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/check_list_clause_list_state.dart';
import 'package:qcdart/state/check_list_state.dart';

class CheckListManagementScreen extends StatefulWidget {
  const CheckListManagementScreen({super.key});

  @override
  State<CheckListManagementScreen> createState() => _CheckListManagementScreenState();
}

class _CheckListManagementScreenState extends State<CheckListManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        drawer: MyDashboardDrawer(),
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
            ],
          ),
        ),
      ),
    );
  }

    void _showCreateDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Checklist'),
          content: Consumer<CheckListClauseListState>(
              builder: (context, checkListClauseListState, child) {
            return Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Checklist'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter checklist';
                  }
                  return null;
                },
                onSaved: (newValue) =>
                    checkListClauseListState.setCheckListName = newValue!,
              ),
            );
          }),
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
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/manage/checklist/edit');
                }
              },
            ),
          ],
        );
      },
    );
  }

}