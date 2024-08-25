import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  late TextEditingController _orgIdController;
  late TextEditingController _plantNameController;
  late TextEditingController _plantIdController;
  late TextEditingController _plantTypeController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  late TextEditingController _countryController;
  late TextEditingController _stateController;
  late TextEditingController _cityController;
  late TextEditingController _pincodeController;
  late TextEditingController _contactNameController;
  late TextEditingController _addressController;

    @override
  void initState() {
    super.initState();
    _orgIdController = TextEditingController();
    _plantNameController = TextEditingController();
    _plantIdController = TextEditingController();
    _plantTypeController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    _countryController = TextEditingController();
    _cityController = TextEditingController();
    _pincodeController = TextEditingController();
    _contactNameController = TextEditingController();
    _addressController = TextEditingController();
    _stateController = TextEditingController();
  }

    @override
  void dispose() {
    _orgIdController.dispose();
    _plantNameController.dispose();
    _plantIdController.dispose();
    _plantTypeController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    _contactNameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ManagePlantState>(
      builder: (context, checkListClauseListState, child) {
      _orgIdController.text = checkListClauseListState.orgId;
      _plantNameController.text = checkListClauseListState.plantName;
      _plantIdController.text = checkListClauseListState.plantId;
      _plantTypeController.text = checkListClauseListState.plantType;
      _emailController.text = checkListClauseListState.email;
      _mobileController.text = checkListClauseListState.mobile;
      _countryController.text = checkListClauseListState.country;
      _stateController.text = checkListClauseListState.state;
      _cityController.text = checkListClauseListState.city;
      _pincodeController.text = checkListClauseListState.pincode;
      _contactNameController.text = checkListClauseListState.contactName;
      _addressController.text = checkListClauseListState.address;
      return Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                key: const Key('orgId'),
                controller: _orgIdController,
                decoration: const InputDecoration(labelText: 'Orginization ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter orginization ID';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.orgId = value!,
              ),
              TextFormField(
                key: const Key('plantName'),
                controller: _plantNameController,
                decoration: const InputDecoration(labelText: 'Plant Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter plant name';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.plantName = value!,
              ),
              TextFormField(
                key: const Key('plantId'),
                controller: _plantIdController,
                decoration: const InputDecoration(labelText: 'Plant ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter plant ID';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.plantId = value!,
              ),
              DropdownButtonFormField<String>(
                key: const Key('plantType'),
                decoration: const InputDecoration(
                  labelText: 'Plant Type',
                ),
                items: ["Item 1", "Item 2", "Item 3"]
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (String? newValue) {},
                validator: (value) =>
                    value == null ? 'Please select plant type' : null,
                onSaved: (String? value) =>
                    checkListClauseListState.plantType = value!,
              ),
              TextFormField(
                key: const Key('email'),
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.email = value!,
              ),
              TextFormField(
                key: const Key('mobile'),
                controller: _mobileController,
                decoration: const InputDecoration(labelText: 'Mobile'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter mobile';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.mobile = value!,
              ),
              TextFormField(
                key: const Key('country'),
                controller: _countryController,
                decoration: const InputDecoration(labelText: 'Country'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter country';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.country = value!,
              ),
              TextFormField(
                key: const Key('state'),
                controller: _stateController,
                decoration: const InputDecoration(labelText: 'State'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter state';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.state = value!,
              ),
              TextFormField(
                key: const Key('city'),
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.city = value!,
              ),
              TextFormField(
                key: const Key('pincode'),
                controller: _pincodeController,
                decoration: const InputDecoration(labelText: 'Pincode'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter pincode';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.pincode = value!,
              ),
              TextFormField(
                key: const Key('contactName'),
                controller: _contactNameController,
                decoration: const InputDecoration(labelText: 'Contact Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter contact name';
                  }
                  return null;
                },
                onSaved: (value) =>
                    checkListClauseListState.contactName = value!,
              ),
              TextFormField(
                key: const Key('address'),
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
                onSaved: (value) => checkListClauseListState.address = value!,
                maxLines: null,
              )
            ],
          ),
        ),
      );
    });
  }

}
