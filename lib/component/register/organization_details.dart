import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/state/register_state.dart';

class OrganizationDetails extends StatefulWidget {
  const OrganizationDetails({super.key});

  @override
  State<OrganizationDetails> createState() => _OrganizationDetailsState();
}

class _OrganizationDetailsState extends State<OrganizationDetails> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _organizationNameController;

  @override
  void initState() {
    super.initState();
    _organizationNameController = TextEditingController();
  }

  @override
  void dispose() {
    _organizationNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterState>(builder: (context, registerState, child) {
      _organizationNameController.text = registerState.orgName;
      return Form(
        key: _formKey,
        child: Column(
          children: [
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Organization details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _organizationNameController,
              key: const Key('organization_name'),
              decoration: const InputDecoration(
                labelText: 'Organization Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your organization name';
                }
                return null;
              },
              onSaved: (newValue) => registerState.setOrgName(newValue!),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    registerState.back();
                  },
                  child: const Text('Back'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      registerState.next();
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
