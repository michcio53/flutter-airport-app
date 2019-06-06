import 'package:airport_flutter/models/flight.dart';
import 'package:airport_flutter/models/flight_fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlightFavsWidget extends StatelessWidget {
  final FlightFav flightFav;
  final Function(int) onPressed;

  const FlightFavsWidget({Key key, @required this.flightFav, @required this.onPressed}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(flightFav.flight.startingCity + " - " + flightFav.flight.destinationCity),
      isThreeLine: true,
      subtitle: Text(flightFav.flight.flightShortName + " Date: " + flightFav.flight.flightDate.toLocal().toString()),
      dense: true,
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => onPressed(flightFav.flight.id),
    );
  }
}