import 'package:equatable/equatable.dart';
import 'package:airport_flutter/models/flight.dart';

abstract class FlightSearchState extends Equatable {
  FlightSearchState([List props = const[]]) : super(props);
}

class FlightSearchStateEmpty  extends FlightSearchState {
  @override
  String toString() => 'SearchStateEmpty';
}

class FlightSearchStateLoading extends FlightSearchState {
  @override
  String toString() => 'FlightSearchStateLoading';
}

class FlightSearchStateSuccess extends FlightSearchState {
  final List<Flight> items;

  FlightSearchStateSuccess(this.items) : super([items]);

  @override
  String toString() => 'FlightSearchStateSuccess';
}

class FlightSearchStateError extends FlightSearchState {
  final String error;

  FlightSearchStateError(this.error) : super([error]);

  @override
  String toString() => 'FlightSearchStateError';
}