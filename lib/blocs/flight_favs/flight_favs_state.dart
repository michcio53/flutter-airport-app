import 'package:equatable/equatable.dart';
import 'package:airport_flutter/models/flight_fav.dart';

abstract class FlightFavsState extends Equatable {
  FlightFavsState([List<FlightFav> props = const[]]) : super(props);
}

class FlightFavsUninitialized extends FlightFavsState {
  @override
  String toString() => "Flight uninitialized";
}

class FlightFavsError extends FlightFavsState {
  @override
  String toString() => "Flight error";
}

class FlightFavsLoaded extends FlightFavsState {
  final List<FlightFav> flights;
  FlightFavsLoaded({this.flights}) : super(flights);

  FlightFavsLoaded copyWith({List<FlightFav> flights}) {
    return FlightFavsLoaded(flights: flights ?? this.flights);
  }

  @override
  String toString() => "FlightLoaded";
}