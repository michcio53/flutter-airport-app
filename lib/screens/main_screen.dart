import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:airport_flutter/screens/search_screen.dart';
import 'package:airport_flutter/widgets/flight_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airport_flutter/blocs/flight/flight.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Flights"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            )
          ],
        ),
        body: _MainScreenPage(),
    );
  }
}

class _MainScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<_MainScreenPage> {
  final FlightBloc _flightBloc = FlightBloc();
  final _scrollController = ScrollController();

  _MainScreenPageState() {
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
          if (state.flights.isEmpty) {
            return Center(child: Text('Noflights'));
          }
        }
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return FlightWidget(
              flight: state.props[index],
            );
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