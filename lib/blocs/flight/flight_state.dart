import 'package:equatable/equatable.dart';
import 'package:airport_flutter/models/flight.dart';

abstract class FlightState extends Equatable {
  FlightState([List<Flight> props = const[]]) : super(props);
}

class FlightUninitialized extends FlightState {
  @override
  String toString() => "Flight uninitialized";
}

class FlightError extends FlightState {
  @override
  String toString() => "Flight error";
}

class FlightLoaded extends FlightState {
  final List<Flight> flights;
  FlightLoaded({this.flights}) : super(flights);

  FlightLoaded copyWith({List<Flight> flights}) {
    return FlightLoaded(flights: flights ?? this.flights);
  }

  @override
  String toString() => "FlightLoaded";
}
