import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/component/dashboard_app_drawer.dart';
import 'package:qcdart/state/user_detail_state.dart';

class UserManagementDetailScreen extends StatefulWidget {
  const UserManagementDetailScreen({super.key});

  @override
  State<UserManagementDetailScreen> createState() =>
      _UserManagementDetailScreenState();
}

class _UserManagementDetailScreenState
    extends State<UserManagementDetailScreen> {
  final List<String> roles = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  List<String> selectedRoles = [];

  List plantMapping = [
    'Plant 1',
    'Plant 2',
    'Plant 3',
    'Plant 4',
  ];

  List<String> selectedPlantMapping = [];

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
                      'User Detail',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<UserDetailState>(
                        builder: (context, state, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Please enter first name'
                                : null,
                            onSaved: (newValue) => state.fname = newValue!,
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                            ),
                            validator: (value) => value!.isEmpty
                                ? 'Please enter last name'
                                : null,
                            onSaved: (newValue) => state.lname = newValue!,
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Please enter email' : null,
                            onSaved: (newValue) => state.email = newValue!,
                          ),

                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                            ),
                            validator: (value) =>
                                value!.isEmpty ? 'Please enter phone' : null,
                            onSaved: (newValue) => state.phone = newValue!,
                          ),

                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Select Role',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: roles.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  //disable default onTap to avoid closing menu when selecting an item
                                  enabled: false,
                                  child: StatefulBuilder(
                                    builder: (context, menuSetState) {
                                      final isSelected =
                                          selectedRoles.contains(item);
                                      return InkWell(
                                        onTap: () {
                                          isSelected
                                              ? selectedRoles.remove(item)
                                              : selectedRoles.add(item);
                                          //This rebuilds the StatefulWidget to update the button's text
                                          setState(() {});
                                          //This rebuilds the dropdownMenu Widget to update the check mark
                                          menuSetState(() {});
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              if (isSelected)
                                                const Icon(
                                                    Icons.check_box_outlined)
                                              else
                                                const Icon(Icons
                                                    .check_box_outline_blank),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                              value: selectedRoles.isEmpty
                                  ? null
                                  : selectedRoles.last,
                              selectedItemBuilder: (context) {
                                return roles.map(
                                  (item) {
                                    return Container(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        "Selected Role: ${selectedRoles.join(', ')}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
                                      ),
                                    );
                                  },
                                ).toList();
                              },
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.zero,
                              ),
                              onChanged: (value) => state.role = value!,
                            ),
                          ),
                          
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Select Plant Mapping',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: roles.map((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  //disable default onTap to avoid closing menu when selecting an item
                                  enabled: false,
                                  child: StatefulBuilder(
                                    builder: (context, menuSetState) {
                                      final isSelected =
                                          selectedPlantMapping.contains(item);
                                      return InkWell(
                                        onTap: () {
                                          isSelected
                                              ? selectedPlantMapping.remove(item)
                                              : selectedPlantMapping.add(item);
                                          //This rebuilds the StatefulWidget to update the button's text
                                          setState(() {});
                                          //This rebuilds the dropdownMenu Widget to update the check mark
                                          menuSetState(() {});
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              if (isSelected)
                                                const Icon(
                                                    Icons.check_box_outlined)
                                              else
                                                const Icon(Icons
                                                    .check_box_outline_blank),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                              value: selectedPlantMapping.isEmpty
                                  ? null
                                  : selectedPlantMapping.last,
                              selectedItemBuilder: (context) {
                                return roles.map(
                                  (item) {
                                    return Container(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Text(
                                        'Plant Mapping ${selectedPlantMapping.join(', ')}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
                                      ),
                                    );
                                  },
                                ).toList();
                              },
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.zero,
                              ),
                              onChanged: (value) => state.role = value!,
                            ),
                          )
                        ],
                      );
                    }),
                  ),
                ),
              ),

              Consumer<UserDetailState>(
                builder: (context, state, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FilledButton(
                        onPressed: () {
                          state.clearUser();
                          Navigator.pop(context);
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
