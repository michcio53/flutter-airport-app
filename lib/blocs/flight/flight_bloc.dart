import 'dart:async';
import 'package:airport_flutter/blocs/flight/flight_event.dart';
import 'package:airport_flutter/blocs/flight/flight_state.dart';
import 'package:bloc/bloc.dart';
import 'package:airport_flutter/repository.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final Repository repository = Repository();

  FlightBloc();

  @override
  FlightState get initialState => FlightUninitialized();

  @override
  Stream<FlightState> mapEventToState(FlightEvent event) async* {
    try {
      if (event is AddToFavs) {
        await repository.addFavs(event.flightId);
        final flights = await repository.fetchFlights();
        yield FlightLoaded(flights: flights);
        return;
    }
      
      if (currentState is FlightUninitialized) {
        final flights = await repository.fetchFlights();
        yield FlightLoaded(flights: flights);
        return;
      }
    } catch(e) {
      print(e.toString());
      yield FlightError();
    }
  } 

}
