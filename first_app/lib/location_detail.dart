import 'package:first_app/styles.dart';
import 'package:flutter/material.dart';
import './models/location.dart';
import './models/location_fact.dart';

class LocationDetail extends StatelessWidget {
  final Location location;
  const LocationDetail(this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(location.name, style: Styles.NavBarTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderBody(context, location),
      ),
    );
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    List<Widget> result = [];
    result.add(_bannerImage(location.url, 170.0));
    for (var res in _renderFacts(location)) {
      result.add(res);
    }

    return result;
  }

  List<Widget> _renderFacts(Location location) {
    List<Widget> result = [];
    List<LocationFact> facts = location.facts;

    for (var fact in facts) {
      result.add(_sectionTitle(fact));
      result.add(_sectionDescription(fact));
    }

    return result;
  }

  Container _sectionTitle(LocationFact fact) => Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
      child: Text(
        fact.getTitle(),
        textAlign: TextAlign.left,
        style: Styles.headerLarge,
      ));

  Container _sectionDescription(LocationFact fact) => Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 15.0),
      child: Text(
        fact.getDescription(),
        style: Styles.textDefault,
      ));

  Widget _bannerImage(String url, double height) {
    return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network(
          url,
          fit: BoxFit.fitWidth,
        ));
  }
}
