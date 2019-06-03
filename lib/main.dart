import 'package:airport_flutter/blocs/flight/flight.dart';
import 'package:airport_flutter/blocs/simple_bloc_delegate.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airport_flutter/widgets/flight_widget.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flight App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flights"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlightBloc _flightBloc = FlightBloc();
  final _scrollController = ScrollController();


  _HomePageState() {
    _flightBloc.dispatch(Fetch());
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _flightBloc,
      builder: (BuildContext context, FlightState state) {
        if (state is FlightUninitialized) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is FlightError) {
          return Center(child: Text('Failed fetch flight'));
        }
        if (state is FlightLoaded) {
          if( state.flights.isEmpty) {
            return Center(child: Text('Noflights'));
          }
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
              return FlightWidget(flight: state.props[index],);
          },
          itemCount: state.props.length,
          controller: _scrollController,
        );
      },
    );
  }

  @override
  void dispose() {
    _flightBloc.dispose();
    super.dispose();
  }

}