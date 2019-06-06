import 'package:airport_flutter/models/flight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlightSearchWidget extends StatelessWidget {
  final Flight flight;

  const FlightSearchWidget({Key key, @required this.flight}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(flight.startingCity + " - " + flight.destinationCity),
      isThreeLine: true,
      subtitle: Text(flight.flightShortName + " Date: " + flight.flightDate.toLocal().toString()),
      dense: true,
    );
  }
}