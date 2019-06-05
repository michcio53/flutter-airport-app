import 'package:equatable/equatable.dart';

class Flight extends Equatable {
  final int id;
  final String destinationCity;
  final String startingCity;
  final DateTime flightDate;
  final String flightShortName;

  Flight({this.destinationCity, this.startingCity, this.flightDate, this.flightShortName, this.id}) : super([destinationCity, startingCity, flightDate, flightShortName, id]);

  @override
  String toString() => 'Flight { $flightShortName}';
}