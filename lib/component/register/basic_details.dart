import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qcdart/state/register_state.dart';

class BasicDetails extends StatefulWidget {

  const BasicDetails({super.key,});

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterState>(
      builder: (context, registerState, child) {
        _firstNameController.text = registerState.fname;
        _lastNameController.text = registerState.lname;
        _emailController.text = registerState.email;
        _phoneController.text = registerState.phone;
        return Form(
          key: _formKey,
          child: Column(
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
                controller: _firstNameController,
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
                onSaved: (newValue) {
                  registerState.setFname(newValue!);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                key: const Key('last_name'),
                controller: _lastNameController,
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
                onSaved: (newValue) {
                  registerState.setLname(newValue!);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
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
                onSaved: (newValue) {
                  registerState.setEmail(newValue!);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
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
                onSaved: (newValue) {
                  registerState.setPhone(newValue!);
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Login'),
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
      },
    );
  }
}
