import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String apiKey =
    'MmVQWUU3ZDJ4WElkT2xUNkxIV2VIRkRVWmFNYVlnYkpwRmVYMkRFWg==';
const String baseUrl = 'https://api.countrystatecity.in/v1';

Future<List<DropdownMenuItem<String>>> fetchCountries() async {
  final response = await http.get(
    Uri.parse('$baseUrl/countries'),
    headers: {'X-CSCAPI-KEY': apiKey},
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<DropdownMenuItem<String>> countries = [];
    jsonDecode(response.body).forEach((country) {
      countries.add(DropdownMenuItem(
        child: Text(country['name']),
        value: country['name'],
      ));
    });
    return countries;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load countries');
  }
}

Future<List<DropdownMenuItem<String>>> fetchStates(String countryCode) async {
  final response = await http.get(
    Uri.parse('$baseUrl/countries/$countryCode/states'),
    headers: {'X-CSCAPI-KEY': apiKey},
  );

  if (response.statusCode == 200) {
    List<DropdownMenuItem<String>> states = [];
    jsonDecode(response.body).forEach((state) {
      states.add(DropdownMenuItem(
        child: Text(state['name']),
        value: state['name'],
      ));
    });
    return states;
  } else {
    throw Exception('Failed to load states');
  }
}

Future<List<DropdownMenuItem<String>>> fetchCities(
    String countryCode, String stateCode) async {
  final response = await http.get(
    Uri.parse('$baseUrl/countries/$countryCode/states/$stateCode/cities'),
    headers: {'X-CSCAPI-KEY': apiKey},
  );

  if (response.statusCode == 200) {
    List<DropdownMenuItem<String>> cities = [];
    jsonDecode(response.body).forEach((city) {
      cities.add(DropdownMenuItem(
        child: Text(city['name']),
        value: city['name'],
      ));
    });
    return cities;
  } else {
    throw Exception('Failed to load cities');
  }
}