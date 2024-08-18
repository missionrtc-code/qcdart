import 'package:flutter/material.dart';
import 'package:qcdart/component/dashboard_app_bar.dart';
import 'package:qcdart/state/check_list_clause_list_state.dart';

class DashboardEditManageScreen extends StatefulWidget {
  const DashboardEditManageScreen({super.key});

  @override
  State<DashboardEditManageScreen> createState() =>
      _DashboardEditManageScreenState();
}

class _DashboardEditManageScreenState extends State<DashboardEditManageScreen> {
  final List<String> _clauseOptions = List.generate(50, (index) => (index + 1).toString());
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
                  Text('Edit Manage',
                      style: Theme.of(context).textTheme.headlineMedium),
                  ElevatedButton(
                    onPressed: () {
                      _showCreateDialog(context);
                    },
                    child: Text('Add Row'),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: CheckListClauseListState().tableRowData.length,
                  itemBuilder: (context, index) {
                    final data = CheckListClauseListState().tableRowData[index];
                    return Card(
                      margin: EdgeInsets.all(8.0),
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
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit'),
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
    AddRowDialog addRowDialog = AddRowDialog(
      clauseOptions: _clauseOptions,
      riskLevels: _riskLevels,
      categories: _categories,
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Row'),
          content: addRowDialog,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                print("addRowDialog._clause ${addRowDialog._clause}");
                // Read the form data here
                // final clause = formKey.currentState!.toString();
                // final subClause = formKey.currentState!.value['subClause'];
                // final clauseDetails = formKey.currentState!.value['clauseDetails'];
                // final helpTopic = formKey.currentState!.value['helpTopic'];
                // final clauseCategory = formKey.currentState!.value['clauseCategory'];
                // final rating = formKey.currentState!.value['rating'];
                // final riskLevel = formKey.currentState!.value['riskLevel'];

                // Do something with the form data
                // print('Sub Clause: $subClause');
                // print('Clause Details: $clauseDetails');
                // print('Help Topic: $helpTopic');
                // print('Clause Category: $clauseCategory');
                // print('Rating: $rating');
                // print('Risk Level: $riskLevel');

              },
              child: Text('Save'),
            ),
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
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}

class AddRowDialog extends StatelessWidget {
  final List<String> clauseOptions;
  final List<String> riskLevels;
  final List<String> categories;
  final _formKey = GlobalKey<FormState>();
  late String _clause;
  late String _subClause;
  late String _clauseDetails;
  late String _helpTopic;
  late String _clauseCategory;
  late String _rating;
  late String _riskLevel;  

  AddRowDialog({super.key, required this.clauseOptions, required this.riskLevels, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField(
            key: Key('clause'),
            value: _clause,
            items: clauseOptions
                .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (value) {
              _clause = value.toString();
            },
          ),
          TextFormField(
            key: Key('subClause'),
            initialValue: _subClause,
            decoration: InputDecoration(labelText: 'Sub Clause'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter sub clause';
              }
              return null;
            },
            onSaved: (value) {
              _subClause = value!;
            },
          ),
          TextFormField(
            key: Key('clauseDetails'),
            initialValue: _clauseDetails,
            decoration: InputDecoration(labelText: 'Clause Details'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter clause details';
              }
              return null;
            },
            onSaved: (value) {
              _clauseDetails = value!;
            },
          ),
          TextFormField(
            key: Key('helpTopic'),
            initialValue: _helpTopic,
            decoration: InputDecoration(labelText: 'Help Topic'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter help topic';
              }
              return null;
            },
            onSaved: (value) {
              _helpTopic = value!;
            },
          ),
          DropdownButtonFormField(
            key: Key('clauseCategory'),
            value: _clauseCategory,
            items: categories
                .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (value) {
              _clauseCategory = value.toString();
            },
          ),
          TextFormField(
            key: Key('rating'),
            initialValue: _rating,
            decoration: InputDecoration(labelText: 'Rating'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter rating';
              }
              return null;
            },
            onSaved: (value) {
              _rating = value!;
            },
          ),
          DropdownButtonFormField(
            key: Key('riskLevel'),
            value: _riskLevel,
            items: riskLevels
                .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (value) {
              _riskLevel = value.toString();
            },
          ),
        ],
      ),
    );
  }
}

// class AddRowDialog extends StatefulWidget {
//   const AddRowDialog(
//       {super.key,
//       required List<String> clauseOptions,
//       required List<String> riskLevels,
//       required List<String> categories})
//       : _clauseOptions = clauseOptions,
//         _riskLevels = riskLevels,
//         _categories = categories;

//   final List<String> _clauseOptions;
//   final List<String> _riskLevels;
//   final List<String> _categories;

//   @override
//   State<AddRowDialog> createState() => _AddRowDialogState(
//       clauseOptions: _clauseOptions,
//       riskLevels: _riskLevels,
//       categories: _categories);
// }

// class _AddRowDialogState extends State<AddRowDialog> {
//   final _formKey = GlobalKey<FormState>();
//   final List<String> clauseOptions;
//   final List<String> riskLevels;
//   final List<String> categories;
//   late String _clause;
//   late String _subClause;
//   late String _clauseDetails;
//   late String _helpTopic;
//   late String _clauseCategory;
//   late String _rating;
//   late String _riskLevel;

//   _AddRowDialogState(
//       {required this.clauseOptions,
//       required this.riskLevels,
//       required this.categories});

//   @override
//   void initState() {
//     super.initState();
//     _clause = clauseOptions.first;
//     _subClause = '';
//     _clauseDetails = '';
//     _helpTopic = '';
//     _clauseCategory = categories.first;
//     _rating = '';
//     _riskLevel = riskLevels.first;
//   }

//   @override
//   Widget build(BuildContext context) {
//     late String clause;
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           DropdownButtonFormField(
//             key: Key('clause'),
//             value: _clause,
//             items: clauseOptions
//                 .map((String value) => DropdownMenuItem(
//                       value: value,
//                       child: Text(value),
//                     ))
//                 .toList(),
//             onChanged: (value) {
//               _clause = value.toString();
//             },
//           ),
//           TextFormField(
//             key: Key('subClause'),
//             initialValue: _subClause,
//             decoration: InputDecoration(labelText: 'Sub Clause'),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter sub clause';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               _subClause = value!;
//             },
//           ),
//           TextFormField(
//             key: Key('clauseDetails'),
//             initialValue: _clauseDetails,
//             decoration: InputDecoration(labelText: 'Clause Details'),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter clause details';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               _clauseDetails = value!;
//             },
//           ),
//           TextFormField(
//             key: Key('helpTopic'),
//             initialValue: _helpTopic,
//             decoration: InputDecoration(labelText: 'Help Topic'),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter help topic';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               _helpTopic = value!;
//             },
//           ),
//           DropdownButtonFormField(
//             key: Key('clauseCategory'),
//             value: _clauseCategory,
//             items: categories
//                 .map((String value) => DropdownMenuItem(
//                       value: value,
//                       child: Text(value),
//                     ))
//                 .toList(),
//             onChanged: (value) {
//               _clauseCategory = value.toString();
//             },
//           ),
//           TextFormField(
//             key: Key('rating'),
//             initialValue: _rating,
//             decoration: InputDecoration(labelText: 'Rating'),
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return 'Please enter rating';
//               }
//               return null;
//             },
//             onSaved: (value) {
//               _rating = value!;
//             },
//           ),
//           DropdownButtonFormField(
//             key: Key('riskLevel'),
//             value: _riskLevel,
//             items: riskLevels
//                 .map((String value) => DropdownMenuItem(
//                       value: value,
//                       child: Text(value),
//                     ))
//                 .toList(),
//             onChanged: (value) {
//               _riskLevel = value.toString();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
