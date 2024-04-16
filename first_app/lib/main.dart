import 'package:flutter/material.dart';
import 'location_detail.dart';
import 'mocks/mock_location.dart';
import 'models/location.dart';

void main() {
  runApp(FirstApp());
}

class FirstApp extends StatelessWidget {
  FirstApp({super.key});
  final Location mockLocation = MockLocation.fetchAny();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LocationDetail(mockLocation));
  }
}
