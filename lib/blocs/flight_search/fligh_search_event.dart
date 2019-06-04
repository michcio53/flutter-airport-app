import 'package:equatable/equatable.dart';

abstract class FlightSearchEvent extends Equatable {
  FlightSearchEvent([List props = const[]]) : super(props);
}

class TextChanged extends FlightSearchEvent {
  final String text;

  TextChanged({this.text}) : super([text]);

  @override
  String toString() => 'TextChanged { text: $text }';
}