import 'package:airport_flutter/screens/favourites_screen.dart';
import 'package:airport_flutter/screens/main_screen.dart';
import 'package:airport_flutter/screens/search_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabScreenPage();
}

class TabScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabScreenPageState();
}

class TabScreenPageState extends State<TabScreenPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
        _selectedIndex = index;
    });
  }

  final List<Widget> _children = [
    MainScreen(),
    FavouritesScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter airport"),
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
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.flight),
            title: new Text('Flights'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
