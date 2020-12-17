import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants/constants.dart';
import 'package:movie_app/src/ui/widgets/widgets.dart';

class TvShowsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: MovieListBuilder(
        title: 'Top Rated',
        typeSection: TOP_RATED,
      ),
    );
  }
}
