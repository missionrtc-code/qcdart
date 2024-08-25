import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/audit_planning_detail.dart';

class AuditPlanningDetailScreen extends StatefulWidget {
  const AuditPlanningDetailScreen({Key? key}) : super(key: key);

  @override
  State<AuditPlanningDetailScreen> createState() =>
      _AuditPlanningDetailScreenState();
}

class _AuditPlanningDetailScreenState extends State<AuditPlanningDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DashboardAppBar(),
        drawer: const MyDashboardDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Audit Planning Detail',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    FilledButton(
                      onPressed: () => _showCreateDialog(context),
                      child: const Text('Add New Row'),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Body of card
                        Consumer<AuditPlanningDetailState>(
                          builder: (context, state, child) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.list.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.grey[200],
                                  margin: const EdgeInsets.all(10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        buildCardRow( 'Sr. No', (index + 1).toString()),
                                        buildCardRow('Plant Name', state.list[index].plantName),
                                        buildCardRow('Audit Type', state.list[index].auditType),
                                        buildCardRow('Audit Date Time', state.list[index].auditDateTime.toString()),
                                        const Divider(),
                                        const Text("Lead Auditor"),
                                        buildCardRow('Audit Type Auditor', state.list[index].auditorsType_1),
                                        buildCardRow('Audit Auditor Name', state.list[index].auditorsName_1),
                                        buildCardRow('Audit Auditees', state.list[index].auditees_1),
                                        const Divider(),
                                        const Text("Support Auditor"),
                                        buildCardRow('Audit Type Auditor', state.list[index].auditorsType_2),
                                        buildCardRow('Audit Auditor Name', state.list[index].auditorsName_2),
                                        buildCardRow('Audit Auditees', state.list[index].auditees_2),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            IconButton(onPressed: () {}, icon: const Icon(Icons.notification_add)),
                                            IconButton(
                                              onPressed: () => state.remove(state.list[index]),
                                              icon: const Icon(Icons.delete_forever),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton(
                    onPressed: () => {
                      context.pop()
                    },
                    child: const Text('Submit'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Audit Planning'),
          content: AuditPlanningDetailDialog(formKey: formKey),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            Consumer<AuditPlanningDetailState>(
                builder: (context, checkListClauseListState, child) {
              return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Save'),
              );
            }),
          ],
        );
      },
    );
  }
}

class AuditPlanningDetailDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const AuditPlanningDetailDialog({super.key, required this.formKey});

  @override
  State<AuditPlanningDetailDialog> createState() =>
      _AuditPlanningDetailDialogState();
}

class _AuditPlanningDetailDialogState extends State<AuditPlanningDetailDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuditPlanningDetailState>(
      builder: (context, state, child) {
        return Form(
          key: widget.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField(
                    decoration:
                        const InputDecoration(labelText: 'Select Plant'),
                    items: ["Plant 1", "Plant 2", "Plant 3"]
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) => {}),
                SizedBox(height: 10),
                DropdownButtonFormField(
                    decoration:
                        const InputDecoration(labelText: 'Select Audit Type'),
                    items: ["Type 1", "Type 2", "Type 3"]
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) => {}),
                FormBuilderDateTimePicker(
                  name: 'auditDateTime',
                  decoration: const InputDecoration(
                    labelText: 'Audit Date',
                    suffixIcon: Icon(Icons.edit_calendar),
                  ),
                  onChanged: (value) => {},
                ),
                Divider(),
                SizedBox(height: 10),
                Text("Lead Auditor"),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Select Auditor'),
                  items: ["Auditor 1", "Auditor 2", "Auditor 3"]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) => {},
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Select Auditees'),
                  items: ["Auditee 1", "Auditee 2", "Auditee 3"]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) => {},
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      labelText: 'Select Audit Checklist'),
                  items: [
                    "Audit Checklistd 1",
                    "Audit Checklist 2",
                    "Audit Checklist 3"
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) => {},
                ),
                Divider(),
                Text("Support Auditor"),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Select Auditor'),
                  items: ["Auditor 1", "Auditor 2", "Auditor 3"]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) => {},
                ),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Select Auditees'),
                  items: ["Auditee 1", "Auditee 2", "Auditee 3"]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) => {},
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                      labelText: 'Select Audit Checklist'),
                  items: [
                    "Audit Checklistd 1",
                    "Audit Checklist 2",
                    "Audit Checklist 3"
                  ]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) => {},
                ),

                SizedBox(height: 10),
                // DropdownButtonFormField(
                //   decoration: const InputDecoration(
                //       labelText: 'Select Type of Auditor 2'),
                //   items: ["Auditor 1", "Auditor 2", "Auditor 3"]
                //       .map((e) => DropdownMenuItem(
                //             child: Text(e),
                //             value: e,
                //           ))
                //       .toList(),
                //   onChanged: (value) => {},
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
