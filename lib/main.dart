import 'package:airport_flutter/blocs/simple_bloc_delegate.dart';
import 'package:airport_flutter/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:airport_flutter/screens/search_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flight App",
      routes: {
        '/search': (BuildContext context) => SearchScreen(),
      },
      home: TabScreen()
    );
  }
}

