import 'package:first_app/location_detail.dart';
import 'package:first_app/styles.dart';
import 'package:flutter/material.dart';
import 'models/location.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations;

  const LocationList(this.locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Locations", style: Styles.navBarTitle),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder:
              _listViewItemBuilder, //this is a callback and therefore you dont call it with args
        ));
  }

  ListTile _listViewItemBuilder(BuildContext context, int index) {
    var location = locations[index];
    return ListTile(
      contentPadding: const EdgeInsets.all(10.0),
      leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () {
        _navigateToLocationDetail(context, index);
      },
    );
  }

  void _navigateToLocationDetail(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationDetail(locations[index])));
  }

  Widget _itemThumbnail(Location location) {
    return Container(
        constraints: const BoxConstraints.tightFor(width: 100.0),
        child: Image.network(
          location.url,
          fit: BoxFit.fitWidth,
        ));
  }

  Widget _itemTitle(Location location) {
    return Text(
      location.name,
      style: Styles.textDefault,
    );
  }
}
