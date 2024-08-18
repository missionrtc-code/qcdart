import 'package:flutter/material.dart';

class OrganizationDetails extends StatelessWidget {
  const OrganizationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
      ],
    );
  }
}
