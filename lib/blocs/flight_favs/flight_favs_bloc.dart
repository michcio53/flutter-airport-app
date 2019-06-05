import 'dart:async';
import 'package:airport_flutter/blocs/flight_favs/flight_favs_event.dart';
import 'package:airport_flutter/blocs/flight_favs/flight_favs_state.dart';

import 'package:bloc/bloc.dart';
import 'package:airport_flutter/repository.dart';

class FlightBloc extends Bloc<FlightFavsEvent, FlightFavsState> {
  final Repository repository = Repository();

  FlightBloc();

  @override
  FlightFavsState get initialState => FlightFavsUninitialized();

  @override
  Stream<FlightFavsState> mapEventToState(FlightFavsEvent event) async* {
    try {
      if (currentState is FlightFavsUninitialized) {
        final flights = await repository.fetchBookedFlights();
        yield FlightFavsLoaded(flights: flights);
        return;
      }
    } catch(e) {
      print(e.toString());
      yield FlightFavsError();
    }
  }  
}