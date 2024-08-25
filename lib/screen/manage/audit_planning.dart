import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/audit_planning.dart';
import 'package:qcdart/state/audit_planning_detail.dart';

class AuditPlanningScreen extends StatefulWidget {
  const AuditPlanningScreen({super.key});

  @override
  State<AuditPlanningScreen> createState() => _AuditPlanningScreenState();
}

class _AuditPlanningScreenState extends State<AuditPlanningScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DashboardAppBar(),
        drawer: const MyDashboardDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Header
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Audit Planning',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    FilledButton(
                      onPressed: () => _showCreateDialog(context),
                      child: const Text('Plan New Audit'),
                    ),
                  ],
                ),
              ),

              // Body of card
              Expanded(
                child: Consumer<AuditPlanningState>(
                  builder: (context, state, child) {
                    return ListView.builder(
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                buildCardRow('Sr. No', (index + 1).toString()),
                                buildCardRow(
                                    'Plant Name', state.list[index].plantName),
                                buildCardRow(
                                    'Audit Type', state.list[index].auditType),
                                buildCardRow('Audit Date Time',
                                    state.list[index].auditDateTime),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () => state
                                          .removeAuditPlan(state.list[index]),
                                      icon: const Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () => {},
                                      icon: const Icon(Icons.delete),
                                    ),
                                    IconButton(
                                      onPressed: () => {},
                                      icon: const Icon(Icons.notification_add),
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
              ),
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
          title: const Text('Audit Planning'),
          content: AuditPlanningDialog(formKey: formKey),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            Consumer<AuditPlanningState>(
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

class AuditPlanningDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const AuditPlanningDialog({super.key, required this.formKey});

  @override
  State<AuditPlanningDialog> createState() => _AuditPlanningDialogState();
}

class _AuditPlanningDialogState extends State<AuditPlanningDialog> {
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
                  decoration: const InputDecoration(labelText: 'Select Plant'),
                  items: ["Plant 1", "Plant 2", "Plant 3"]
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) => {},
                  onSaved: (value) => state.plantName = value.toString(),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration:
                      const InputDecoration(labelText: 'Select Audit Type'),
                  items: ["Type 1", "Type 2", "Type 3"]
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (value) => {},
                  onSaved: (value) => state.auditType = value.toString(),
                ),
                FormBuilderDateTimePicker(
                  name: 'auditDateTime',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'From Audit Date',
                    suffixIcon: Icon(Icons.edit_calendar),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                  onChanged: (value) =>
                      state.startAuditDateTime = value.toString(),
                  onSaved: (value) =>
                      state.startAuditDateTime = value.toString(),
                ),
                FormBuilderDateTimePicker(
                  name: 'auditDateTime',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    labelText: 'To Audit Date',
                    suffixIcon: Icon(Icons.edit_calendar),
                  ),
                  validator: (toDateStr) {
                    if (toDateStr == null) {
                      return 'Please select a date';
                    }
                  
                    // Convert string to DateTime
                    DateTime fromDate = DateTime.parse(state.startAuditDateTime);
                    DateTime toDate = DateTime.parse(toDateStr.toString());
                  
                    // Check if toDate is greater than fromDate
                    if (toDate.isBefore(fromDate)) {
                      return 'To Date should be greater than From Date';
                    }
                  
                    return null;
                  },
                  onChanged: (value) => state.endAuditDateTime = value.toString(),
                  onSaved: (value) => state.endAuditDateTime = value.toString(),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
