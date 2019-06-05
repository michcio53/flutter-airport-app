import 'package:equatable/equatable.dart';
import 'package:airport_flutter/models/flight.dart';

class FlightFav extends Equatable {
  final int id;
  final Flight flight;
  FlightFav({this.id, this.flight}) : super([id, flight]);

  @override
  String toString() => 'Flight { $id}';
}