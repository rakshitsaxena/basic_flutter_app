import 'package:first_app/location_list.dart';
import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'mocks/mock_location.dart';
import 'models/location.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  FirstApp({super.key});
  final List<Location> mockLocations = MockLocation.fetchAll();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationList(mockLocations));
  }
}
