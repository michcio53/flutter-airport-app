import 'package:equatable/equatable.dart';

abstract class FlightEvent extends Equatable {}

class Fetch extends FlightEvent {
  @override
  String toString() => "Fetch flights";
}