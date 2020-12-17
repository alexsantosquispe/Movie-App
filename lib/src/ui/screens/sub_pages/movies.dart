import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/constants.dart';
import 'package:movie_app/src/ui/widgets/widgets.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: MovieListBuilder(
        title: 'Upcoming',
        typeSection: UPCOMING,
      ),
    );
  }
}
