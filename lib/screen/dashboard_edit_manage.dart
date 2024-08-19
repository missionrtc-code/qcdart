import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/state/check_list_clause_list_state.dart';

class DashboardEditManageScreen extends StatefulWidget {
  const DashboardEditManageScreen({super.key});

  @override
  State<DashboardEditManageScreen> createState() =>
      _DashboardEditManageScreenState();
}

class _DashboardEditManageScreenState extends State<DashboardEditManageScreen> {
  final List<String> _clauseOptions =
      List.generate(50, (index) => (index + 1).toString());
  final List<String> _riskLevels = [
    'Catastrophic',
    'Major',
    'Minor',
    'Moderate',
    'Insignificant'
  ];
  final List<String> _categories = ['Heading', 'Checkpoint'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<CheckListClauseListState>(
                      builder: (context, checkListClauseListState, child) {
                    return Text(checkListClauseListState.getCheckListName,
                        style: Theme.of(context).textTheme.headlineMedium);
                  }),
                  ElevatedButton(
                    onPressed: () {
                      _showCreateDialog(context);
                    },
                    child: const Text('Add Row'),
                  ),
                ],
              ),
              Expanded(
                child: Consumer<CheckListClauseListState>(
                    builder: (context, checkListClauseListState, child) {
                  return ListView.builder(
                    itemCount: checkListClauseListState.tableRowData.length,
                    itemBuilder: (context, index) {
                      final data = checkListClauseListState.tableRowData[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildCardRow('Clause:', data.clause),
                              _buildCardRow('Sub Clause:', data.subClause),
                              _buildCardRow(
                                  'Clause Details:', data.clauseDetails),
                              _buildCardRow('Help Topic:', data.helpTopic),
                              _buildCardRow(
                                  'Clause Category:', data.clauseCategory),
                              _buildCardRow('Rating:', data.rating),
                              _buildCardRow('Risk Level:', data.riskLevel),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      checkListClauseListState
                                          .removeTableRowData(data);
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data submitted successfully'),
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Row'),
          content: AddRowDialog(
              clauseOptions: _clauseOptions,
              riskLevels: _riskLevels,
              categories: _categories,
              formKey: formKey),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            Consumer<CheckListClauseListState>(
                builder: (context, checkListClauseListState, child) {
              return ElevatedButton(
                onPressed: () {
                  if (checkListClauseListState.tableRowData.length >= 10) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Maximum 10 rows are allowed'),
                      ),
                    );
                    return;
                  }
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    checkListClauseListState.addTableRowData(TableRowData(
                      clause: checkListClauseListState.getClause,
                      subClause: checkListClauseListState.getSubClause,
                      clauseDetails: checkListClauseListState.getClauseDetails,
                      helpTopic: checkListClauseListState.getHelpTopic,
                      clauseCategory:
                          checkListClauseListState.getClauseCategory,
                      rating: checkListClauseListState.getRating,
                      riskLevel: checkListClauseListState.getRiskLevel,
                    ));
                    // print(object);
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

  Widget _buildCardRow(String label, String value) {
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
}

class AddRowDialog extends StatefulWidget {
  final List<String> clauseOptions;
  final List<String> riskLevels;
  final List<String> categories;

  GlobalKey<FormState> formKey;

  AddRowDialog(
      {super.key,
      required this.clauseOptions,
      required this.riskLevels,
      required this.categories,
      required this.formKey});

  @override
  State<AddRowDialog> createState() => _AddRowDialogState();
}

class _AddRowDialogState extends State<AddRowDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckListClauseListState>(
        builder: (context, checkListClauseListState, child) {
      return Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField(
                key: const Key('clause'),
                decoration: const InputDecoration(labelText: 'Clause'),
                items: widget.clauseOptions
                    .map((String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                validator: (value) =>
                    value == null ? 'Please select clause' : null,
                onChanged: (value) =>
                    checkListClauseListState.setClause = value.toString(),
              ),
              TextFormField(
                key: const Key('subClause'),
                decoration: const InputDecoration(labelText: 'Sub Clause'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter sub clause';
                  }
                  return null;
                },
                onSaved: (value) =>
                    checkListClauseListState.setSubClause = value!,
              ),
              TextFormField(
                key: const Key('clauseDetails'),
                decoration: const InputDecoration(labelText: 'Clause Details'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter clause details';
                  }
                  return null;
                },
                onSaved: (value) =>
                    checkListClauseListState.setClauseDetails = value!,
              ),
              TextFormField(
                key: const Key('helpTopic'),
                decoration: const InputDecoration(labelText: 'Help Topic'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter help topic';
                  }
                  return null;
                },
                onSaved: (value) =>
                    checkListClauseListState.setHelpTopic = value!,
              ),
              DropdownButtonFormField(
                key: const Key('clauseCategory'),
                decoration: const InputDecoration(labelText: 'Clause Category'),
                items: widget.categories
                    .map((String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (value) => checkListClauseListState
                    .setClauseCategory = value.toString(),
              ),
                // DropdownButtonFormField(
                // key: const Key('rating'),
                // decoration: const InputDecoration(labelText: 'Rating'),
                // items: widget.clauseOptions
                //   .map((String value) => DropdownMenuItem(
                //       value: value,
                //       child: Text(value),
                //     ))
                //   .toList(),
                // validator: (value) {
                //   if (value == null) {
                //   return 'Please enter rating';
                //   }
                //   return null;
                // },
                // onChanged: (value) => null,
                // onSaved: (value) => checkListClauseListState.setRating = value.toString(),
                // ),
              TextFormField(
                key: const Key('rating'),
                decoration: const InputDecoration(labelText: 'Rating'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter rating';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.setRating = value!,
                enabled: checkListClauseListState.getClauseCategory == 'Checkpoint',
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField(
                key: const Key('riskLevel'),
                decoration: const InputDecoration(labelText: 'Risk Level'),
                items: widget.riskLevels
                    .map((String value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (value) =>
                    checkListClauseListState.setRiskLevel = value.toString(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
