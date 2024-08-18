import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/state/register_state.dart';

class PasswordDetails extends StatefulWidget {
  const PasswordDetails({
    super.key,
  });

  @override
  State<PasswordDetails> createState() => _PasswordDetailsState();
}

class _PasswordDetailsState extends State<PasswordDetails> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterState>(builder: (context, registerState, child) {
      _passwordController.text = registerState.password;
      _confirmPasswordController.text = registerState.password;
      return Form(
        key: _formKey,
        child: Column(
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
              controller: _passwordController,
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
              onSaved: (newValue) => registerState.setPassword(newValue!)
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
                if (value!.isEmpty && value != _passwordController.text) {
                  return 'Please enter the same password';
                }
                return null;
              },
            ),
            const SizedBox(height: 16,),
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
