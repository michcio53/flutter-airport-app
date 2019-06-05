import 'package:equatable/equatable.dart';

abstract class FlightFavsEvent extends Equatable {}

class Fetch extends FlightFavsEvent {
  @override
  String toString() => "Fetch flights";
}