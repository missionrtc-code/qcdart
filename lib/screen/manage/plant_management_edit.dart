import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/manage_plant_state.dart';

class PlantManagementEditScreen extends StatefulWidget {
  const PlantManagementEditScreen({super.key});

  @override
  State<PlantManagementEditScreen> createState() =>
      _PlantManagementEditScreenState();
}

class _PlantManagementEditScreenState extends State<PlantManagementEditScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DashboardAppBar(),
        drawer: const MyDashboardDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<ManagePlantState>(
                      builder: (context, managePlantState, child) {
                    return Text(managePlantState.plantName,
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
                child: Consumer<ManagePlantState>(
                    builder: (context, managePlantState, child) {
                  return ListView.builder(
                    itemCount: managePlantState.list.length,
                    itemBuilder: (context, index) {
                      final data = managePlantState.list[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _buildCardRow('Orginization ID:', data.orgId),
                              _buildCardRow('Plant Name:', data.plantName),
                              _buildCardRow('Plant ID:', data.plantId),
                              _buildCardRow('Plant Type:', data.plantType),
                              _buildCardRow('Email:', data.email),
                              _buildCardRow('Mobile:', data.mobile),
                              _buildCardRow('Country:', data.country),
                              _buildCardRow('State', data.state),
                              _buildCardRow('City:', data.city),
                              _buildCardRow('Pincode:', data.pincode),
                              _buildCardRow('Contact Name:', data.contactName),
                              _buildCardRow('Address:', data.address),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      managePlantState.removePlant(data);
                                    },
                                    icon: const Icon(Icons.delete),
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
        return Consumer<ManagePlantState>(
            builder: (context, checkListClauseListState, child) {
          return AlertDialog(
            title: const Text('Add Row'),
            content: AddRowDialog(formKey: formKey),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.of(context).pop();
                    checkListClauseListState.addPlant();
                  }
                },
                child: const Text('Save'),
              )
            ],
          );
        });
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
  final GlobalKey<FormState> formKey;

  const AddRowDialog({super.key, required this.formKey});

  @override
  State<AddRowDialog> createState() => _AddRowDialogState();
}

class _AddRowDialogState extends State<AddRowDialog> {
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
                enabled: false,
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
                enabled: false,
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
