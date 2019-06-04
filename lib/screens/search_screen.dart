import 'package:airport_flutter/blocs/flight_search/fligh_search_event.dart';
import 'package:airport_flutter/blocs/flight_search/flight_search_state.dart';
import 'package:airport_flutter/repository.dart';
import 'package:airport_flutter/widgets/flight_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airport_flutter/blocs/flight_search/flight_search.dart';

class SearchScreen extends StatelessWidget {
  final FlightSearchBloc flightSearchBloc = FlightSearchBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search screen"),
      ),
      body: _SearchScreenPage(flightSearchBloc: flightSearchBloc),
    );
  }
}

class _SearchScreenPage extends StatefulWidget {
  final FlightSearchBloc flightSearchBloc;

  _SearchScreenPage({this.flightSearchBloc});

  @override
  State<StatefulWidget> createState() => _SearchScreenPageState();
}

class _SearchScreenPageState extends State<_SearchScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _SearchBar(
          flightSearchBloc: widget.flightSearchBloc,
        ),
        _SearchList(
          flightSearchBloc: widget.flightSearchBloc,
        )
      ],
    );
  }
}

class _SearchBar extends StatefulWidget {
  final FlightSearchBloc flightSearchBloc;

  _SearchBar({this.flightSearchBloc});

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: 'Enter what to search'),
      controller: _textController,
      onChanged: (text) {
        widget.flightSearchBloc.dispatch(TextChanged(text: text));
      },
    );
  }
}

class _SearchList extends StatelessWidget {
  final FlightSearchBloc flightSearchBloc;
  final _scrollController = ScrollController();

  _SearchList({Key key, this.flightSearchBloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: flightSearchBloc,
        builder: (BuildContext context, FlightSearchState state) {
          if (state is FlightSearchStateEmpty) {
            return Text("Please write something");
          }
          if (state is FlightSearchStateLoading) {
            return CircularProgressIndicator();
          }

          if (state is FlightSearchStateError) {
            return Text(state.error);
          }

          if (state is FlightSearchStateSuccess) {
            return state.items.isEmpty
                ? Text("No search results")
                : Expanded(child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FlightWidget(flight: state.items[index]);
                    }),);
            
          }
        });
  }
}
