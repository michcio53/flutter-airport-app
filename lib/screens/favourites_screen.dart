import 'package:flutter/material.dart';
import 'package:airport_flutter/blocs/flight_favs/flight_fav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airport_flutter/widgets/flight_favs_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FavouritesScreenPage();
}

class FavouritesScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavouritesScreenPageState();
}

class FavouritesScreenPageState extends State<FavouritesScreenPage> {
  FlightFavsBloc _flightFavsBloc = FlightFavsBloc();
  final _scrollController = ScrollController();

  FavouritesScreenPageState() {
    _flightFavsBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _flightFavsBloc,
      builder: (BuildContext context, FlightFavsState state) {
        if (state is FlightFavsUninitialized) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is FlightFavsError) {
          return Center(child: Text('Failed fetch flight'));
        }

        if (state is FlightFavsLoaded) {
          if (state.flights.isEmpty) {
            return Center(child: Text('Noflights'));
          }
        }

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return FlightFavsWidget(
              flightFav: state.props[index],
              onPressed: (id) {
                _launchURL(id);
              },
            );
          },
          itemCount: state.props.length,
          controller: _scrollController,
        );
      },
    );
  }

  _launchURL(int flightId) async {
  String url = 'http://localhost:8000/test/$flightId/';
  print(url);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  void dispose() {
    _flightFavsBloc.dispose();
    super.dispose();
  }
}
