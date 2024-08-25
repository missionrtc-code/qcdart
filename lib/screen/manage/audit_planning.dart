import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/auth/app_router.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/audit_planning.dart';

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
          title: const Text('Add Plant'),
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

                    /// api call

                    Navigator.of(context).pop();

                    // Provider.of<ManagePlantState>(context, listen: false)
                    //     .plantName = checkListClauseListState.plantName;
                    // Provider.of<ManagePlantState>(context, listen: false)
                    //     .plantId = '#NA';

                    context.goNamed(RoutePath.dashboardAuditPlanningDetail.name,
                        pathParameters: {'id': 'NEW'});
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
    return Consumer<AuditPlanningState>(
      builder: (context, state, child) {
        return Form(
          key: widget.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const Key('auditName'),
                  decoration: const InputDecoration(labelText: 'Audit Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter audit name';
                    }
                    return null;
                  },
                  // onSaved: (value) => state.plantName = value!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
