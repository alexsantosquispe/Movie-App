import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:movie_app/src/ui/screens/sub_pages/movies.dart';
import 'package:movie_app/src/ui/screens/screens.dart';

class MainContainer extends StatefulWidget {
  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedIndex = 0;
  final List<Widget> _subPages = [
    MoviesPage(),
    TvShowsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Feather.menu),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Movie App',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SafeArea(
        child: _subPages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Feather.film),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.tv),
            label: 'TV Shows',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
