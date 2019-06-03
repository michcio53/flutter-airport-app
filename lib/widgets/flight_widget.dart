import 'package:airport_flutter/models/flight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlightWidget extends StatelessWidget {
  final Flight flight;

  const FlightWidget({Key key, @required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${flight.flightShortName}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(flight.destinationCity),
      isThreeLine: true,
      subtitle: Text(flight.startingCity),
      dense: true,
    );
  }
}