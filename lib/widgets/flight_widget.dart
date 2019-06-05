import 'package:airport_flutter/models/flight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlightWidget extends StatelessWidget {
  final Flight flight;
  final Function(int) onPressed;

  const FlightWidget({Key key, @required this.flight, @required this.onPressed}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(flight.startingCity + " - " + flight.destinationCity),
      isThreeLine: true,
      subtitle: Text(flight.flightShortName + " Date: " + flight.flightDate.toLocal().toString()),
      dense: true,
      trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => onPressed(flight.id),
          ),
    );
  }
}