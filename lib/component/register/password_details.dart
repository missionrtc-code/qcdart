import 'package:flutter/material.dart';

class PasswordDetails extends StatelessWidget {
  const PasswordDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            'Password details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          key: const Key('password'),
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty || value.length < 8) {
              return 'Please enter a strong password';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          key: const Key('confirm_password'),
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter the same password';
            }
            return null;
          },
        ),
      ],
    );
  }
}