import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:qcdart/state/register_state.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({super.key});

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  final _formKey = GlobalKey<FormState>();

  static const String apiKey =
      'MmVQWUU3ZDJ4WElkT2xUNkxIV2VIRkRVWmFNYVlnYkpwRmVYMkRFWg==';
  static const String baseUrl = 'https://api.countrystatecity.in/v1';

  List<dynamic> countries = [];
  List<dynamic> states = [];
  List<dynamic> cities = [];

  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  Future<void> signUp() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse('http://dev.qcdart.com/api/user/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'firstName': Provider.of<RegisterState>(context, listen: false).fname,
          'lastName': Provider.of<RegisterState>(context, listen: false).lname,
          'email': Provider.of<RegisterState>(context, listen: false).email,
          'phoneNumber':
              Provider.of<RegisterState>(context, listen: false).phone,
          'password':
              Provider.of<RegisterState>(context, listen: false).password,
          'confirmPassword':
              Provider.of<RegisterState>(context, listen: false).password,
          'organizationName':
              Provider.of<RegisterState>(context, listen: false).orgName,
          'country': Provider.of<RegisterState>(context, listen: false).country,
          'state': Provider.of<RegisterState>(context, listen: false).state,
          'city': Provider.of<RegisterState>(context, listen: false).city,
          'pincode': Provider.of<RegisterState>(context, listen: false).pincode,
          'address': Provider.of<RegisterState>(context, listen: false).address,
        }),
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful')),
        );
        Provider.of<RegisterState>(context, listen: false).next();
        // Navigate to login or home page if necessary
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed')),
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  Future<void> fetchCountries() async {
    final response = await http.get(
      Uri.parse('$baseUrl/countries'),
      headers: {'X-CSCAPI-KEY': apiKey},
    );

    if (response.statusCode == 200) {
      setState(() {
        countries = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<void> fetchStates(String countryCode) async {
    final response = await http.get(
      Uri.parse('$baseUrl/countries/$countryCode/states'),
      headers: {'X-CSCAPI-KEY': apiKey},
    );

    if (response.statusCode == 200) {
      setState(() {
        states = json.decode(response.body);
        cities = [];
        selectedState = null;
        selectedCity = null;
      });
    } else {
      throw Exception('Failed to load states');
    }
  }

  Future<void> fetchCities(String countryCode, String stateCode) async {
    final response = await http.get(
      Uri.parse('$baseUrl/countries/$countryCode/states/$stateCode/cities'),
      headers: {'X-CSCAPI-KEY': apiKey},
    );

    if (response.statusCode == 200) {
      setState(() {
        cities = json.decode(response.body);
        selectedCity = null;
      });
    } else {
      throw Exception('Failed to load cities');
    }
  }

  String getCountryCode(String countryName) {
    for (var country in countries) {
      if (country['name'] == countryName) {
        return country['iso2'];
      }
    }
    return '';
  }

  String getStateCode(String stateName) {
    for (var state in states) {
      if (state['name'] == stateName) {
        return state['iso2'];
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterState>(builder: (context, registerState, child) {
      return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'Address details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(),
              ),
              value: selectedCountry,
              validator: (value) {
                if (value == null) {
                  return 'Please select a country';
                }
                return null;
              },
              onSaved: (newValue) => registerState.setCountry(newValue!),
              items: countries.map<DropdownMenuItem<String>>((dynamic value) {
                return DropdownMenuItem<String>(
                  value: value['name'],
                  child: Text(value['name']),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCountry = newValue;
                  if (selectedCountry != null) {
                    fetchStates(getCountryCode(selectedCountry!));
                  }
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'State',
                border: OutlineInputBorder(),
              ),
              value: selectedState,
              validator: (value) {
                if (value == null) {
                  return 'Please select a state';
                }
                return null;
              },
              onSaved: (newValue) => registerState.setState(newValue!),
              items: states.map<DropdownMenuItem<String>>((dynamic value) {
                return DropdownMenuItem<String>(
                  value: value['name'],
                  child: Text(value['name']),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedState = newValue;
                  if (selectedCountry != null && selectedState != null) {
                    fetchCities(getCountryCode(selectedCountry!),
                        getStateCode(selectedState!));
                  }
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  labelText: 'City', border: OutlineInputBorder()),
              value: selectedCity,
              validator: (value) {
                if (value == null) {
                  return 'Please select a city';
                }
                return null;
              },
              onSaved: (newValue) => registerState.setCity(newValue!),
              items: cities.map<DropdownMenuItem<String>>((dynamic value) {
                return DropdownMenuItem<String>(
                  value: value['name'],
                  child: Text(value['name']),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedCity = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              key: const Key('pincode'),
              decoration: const InputDecoration(
                labelText: 'Pincode',
                border: OutlineInputBorder(),
              ),
              onSaved: (newValue) => registerState.setPincode(newValue!),
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Please enter a valid pincode';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              key: const Key('address'),
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              onSaved: (newValue) => registerState.setAddress(newValue!),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
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
                _isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState!.save();
                            signUp();
                          }
                        },
                        child: const Text('Submit'),
                      ),
              ],
            )
          ],
        ),
      );
    });
  }
}
