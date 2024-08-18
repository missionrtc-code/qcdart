import 'package:flutter/material.dart';
import 'package:qcdart/lib/load_countries.dart';

class AddressDetails extends StatefulWidget {
  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {

  @override
  Widget build(BuildContext context) {
    return Form(
      key: const Key('address_form'),
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
      
          FutureBuilder(
            future: fetchCountries(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return DropdownButtonFormField(
                  key: const Key('country'),
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                  items: snapshot.data as List<DropdownMenuItem<String>>,
                  onChanged: (value) {},
                  validator: (value) => value == null ? 'Please select a country' : null,
                  hint: const Text('Select Country'),
                );
              }
            },
          ),
      
          const SizedBox(height: 10),
      
          // country.isNotEmpty ?
          // DropdownButtonFormField(
          //   key: const Key('state'),
          //   decoration: const InputDecoration(
          //     labelText: 'State',
          //     border: OutlineInputBorder(),
          //   ),
          //   items: _countries,
          //   onChanged: (value) {
          //     print(value);
          //   },
          //   hint: const Text('Select State'),
          // ) : const SizedBox.shrink(),
      
          const SizedBox(height: 10),
          DropdownButtonFormField(
            key: const Key('city'),
            decoration: const InputDecoration(
              labelText: 'City',
              border: OutlineInputBorder(),
            ),
            items: _countries,
            onChanged: (value) {
              print(value);
            },
            hint: const Text('Select City'),
          ),
      
          const SizedBox(height: 10),
          TextFormField(
            key: const Key('pincode'),
            decoration: const InputDecoration(
              labelText: 'Pincode',
              border: OutlineInputBorder(),
            ),
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}


List<DropdownMenuItem<String>> _countries = [
  DropdownMenuItem(child: Text('USA'), value: 'USA'),
  DropdownMenuItem(child: Text('Canada'), value: 'Canada'),
  DropdownMenuItem(child: Text('Mexico'), value: 'Mexico'),
];
