import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/manage_plant_state.dart';

class PlantManagementScreen extends StatefulWidget {
  const PlantManagementScreen({super.key});

  @override
  State<PlantManagementScreen> createState() => _PlantManagementScreenState();
}

class _PlantManagementScreenState extends State<PlantManagementScreen> {
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
                      'Plant Management',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    FilledButton(
                      onPressed: () => _showCreateDialog(context),
                      child: const Text('Add New Plant'),
                    ),
                  ],
                ),
              ),

              // Body of card
              Expanded(
                child: Consumer<ManagePlantState>(
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
                                _buildCardRow('Sr. No', (index + 1).toString()),
                                _buildCardRow('Plant Type', state.list[index].plantType),
                                _buildCardRow('Plant Name', state.list[index].plantName),
                                _buildCardRow('Date of last update', state.list[index].dateOfLastUpdate),
                                _buildCardRow('Updated by', state.list[index].updatedBy),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
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

  void _showCreateDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Plant'),
          content: AddPlantDialog(formKey: formKey),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            Consumer<ManagePlantState>(
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




class AddPlantDialog extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const AddPlantDialog({super.key, required this.formKey});

  @override
  State<AddPlantDialog> createState() => AddPlantgState();
}

class AddPlantgState extends State<AddPlantDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ManagePlantState>(
      builder: (context, state, child) {
        return Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              // DropdownButtonFormField(
              //   key: const Key('clause'),
              //   decoration: const InputDecoration(labelText: 'Clause'),
              //   items: widget.clauseOptions
              //       .map((String value) => DropdownMenuItem(
              //             value: value,
              //             child: Text(value),
              //           ))
              //       .toList(),
              //   validator: (value) =>
              //       value == null ? 'Please select clause' : null,
              //   onChanged: (value) =>
              //       checkListClauseListState.setClause = value.toString(),
              // ),
              // TextFormField(
              //   key: const Key('subClause'),
              //   decoration: const InputDecoration(labelText: 'Sub Clause'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter sub clause';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) =>
              //       checkListClauseListState.setSubClause = value!,
              // ),
              // TextFormField(
              //   key: const Key('clauseDetails'),
              //   decoration: const InputDecoration(labelText: 'Clause Details'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter clause details';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) =>
              //       checkListClauseListState.setClauseDetails = value!,
              // ),
              // TextFormField(
              //   key: const Key('helpTopic'),
              //   decoration: const InputDecoration(labelText: 'Help Topic'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter help topic';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) =>
              //       checkListClauseListState.setHelpTopic = value!,
              // ),
              // DropdownButtonFormField(
              //   key: const Key('clauseCategory'),
              //   decoration: const InputDecoration(labelText: 'Clause Category'),
              //   items: widget.categories
              //       .map((String value) => DropdownMenuItem(
              //             value: value,
              //             child: Text(value),
              //           ))
              //       .toList(),
              //   onChanged: (value) => checkListClauseListState
              //       .setClauseCategory = value.toString(),
              // ),
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
              // TextFormField(
              //   key: const Key('rating'),
              //   decoration: const InputDecoration(labelText: 'Rating'),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Please enter rating';
              //     }
              //     return null;
              //   },
              //   onSaved: (value) => checkListClauseListState.setRating = value!,
              //   enabled: checkListClauseListState.getClauseCategory == 'Checkpoint',
              //   keyboardType: TextInputType.number,
              // ),
              // DropdownButtonFormField(
              //   key: const Key('riskLevel'),
              //   decoration: const InputDecoration(labelText: 'Risk Level'),
              //   items: widget.riskLevels
              //       .map((String value) => DropdownMenuItem(
              //             value: value,
              //             child: Text(value),
              //           ))
              //       .toList(),
              //   onChanged: (value) =>
              //       checkListClauseListState.setRiskLevel = value.toString(),
              // ),
            ],
          ),
        ),
      );;
      }
    );
  }
}