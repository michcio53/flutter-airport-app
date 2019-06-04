import 'dart:async';

import 'package:airport_flutter/repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:airport_flutter/blocs/flight_search/fligh_search_event.dart';
import 'package:airport_flutter/blocs/flight_search/flight_search_state.dart';

class FlightSearchBloc extends Bloc<FlightSearchEvent, FlightSearchState> {
  final Repository repository = Repository();
  @override
  FlightSearchState get initialState => FlightSearchStateEmpty();

  @override
  Stream<FlightSearchState> mapEventToState(FlightSearchEvent event) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield FlightSearchStateEmpty();
      } else {
        yield FlightSearchStateLoading();
        try {
          final results = await repository.searchFlights(searchTerm);
          yield FlightSearchStateSuccess(results);
        } catch (error) {
          yield error is FlightSearchStateError
              ? FlightSearchStateError(error.toString())
              : FlightSearchStateError('something went wrong');
        }
      }
    }
  }
}
