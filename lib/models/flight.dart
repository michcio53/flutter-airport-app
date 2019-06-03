import 'package:equatable/equatable.dart';

class Flight extends Equatable {
  final String destinationCity;
  final String startingCity;
  final DateTime flightDate;
  final String flightShortName;

  Flight({this.destinationCity, this.startingCity, this.flightDate, this.flightShortName}) : super([destinationCity, startingCity, flightDate, flightShortName]);

  @override
  String toString() => 'Flight { $flightShortName}';
}