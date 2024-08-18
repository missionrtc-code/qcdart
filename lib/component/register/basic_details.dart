import 'package:flutter/material.dart';

class BasicDetails extends StatelessWidget {
  const BasicDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            'Basic Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          key: const Key('first_name'),
          decoration: const InputDecoration(
            labelText: 'First Name',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your first name';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          key: const Key('last_name'),
          decoration: const InputDecoration(
            labelText: 'Last Name',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your last name';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          key: const Key('email'),
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          key: const Key('phone'),
          decoration: const InputDecoration(
            labelText: 'Mobile',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value!.isEmpty || value.length < 10) {
              return 'Please enter a valid mobile number';
            }
            return null;
          },
        ),
      ],
    );
  }
}