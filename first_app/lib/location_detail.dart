import 'package:flutter/material.dart';
import './models/location.dart';
import './models/location_fact.dart';

class LocationDetail extends StatelessWidget {
  final Location location;
  const LocationDetail(this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(location.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderFacts(location.facts),
      ),
    );
  }

  List<Widget> _renderFacts(List<LocationFact> facts) {
    List<Text> factList = [];
    for (var fact in facts) {
      factList.add(Text(fact.title));
      factList.add(Text(fact.text));
    }

    Widget _bannerImage(String url, double height) {
      return Container(
          child: Image.network(
        url,
        fit: BoxFit.fitWidth,
      ));
    }

    return factList;
  }
}
