import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/auth/app_router.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/manage_plant_state.dart';
import 'package:qcdart/state/manage_plants_state.dart';

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
                child: Consumer<ManagePlantsState>(
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
                              _buildCardRow('Plant Type',
                                  state.list[index].plantType.join(', ')),
                              _buildCardRow(
                                  'Plant Name', state.list[index].plantName),
                              _buildCardRow('Date of last update',
                                  state.list[index].dateOfLastUpdate),
                              _buildCardRow(
                                  'Updated by', state.list[index].updatedBy),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(onPressed: () => state.removePlant(state.list[index]), icon: const Icon(Icons.edit)),
                                  IconButton(onPressed: () => {}, icon: const Icon(Icons.delete)),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
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
            Consumer<ManagePlantsState>(
                builder: (context, checkListClauseListState, child) {
              return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    /// api call

                    Navigator.of(context).pop();

                    Provider.of<ManagePlantState>(context, listen: false)
                        .plantName = checkListClauseListState.plantName;
                    Provider.of<ManagePlantState>(context, listen: false)
                        .plantId = '#NA';

                    context.goNamed(
                        RoutePath.dashboardPlantManagementDetail.name,
                        pathParameters: {'id': '#NA'});
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
    return Consumer<ManagePlantsState>(
      builder: (context, state, child) {
        return Form(
          key: widget.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  key: const Key('plantName'),
                  decoration: const InputDecoration(labelText: 'Plant Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter plant name';
                    }
                    return null;
                  },
                  onSaved: (value) => state.plantName = value!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
