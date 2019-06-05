import 'package:equatable/equatable.dart';

abstract class FlightEvent extends Equatable {}

class Fetch extends FlightEvent {
  @override
  String toString() => "Fetch flights";
}

class AddToFavs extends FlightEvent {
  final int flightId;

  AddToFavs({this.flightId});

  @override
  String toString() => "Add to favs";
}