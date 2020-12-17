import 'package:flutter/material.dart';
import 'package:movie_app/src/core/models/models.dart';
import 'package:movie_app/src/ui/widgets/widgets.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key key,
    this.header,
    this.movies,
    this.isSmall = true,
  }) : super(key: key);

  final String header;
  final List<Movie> movies;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      children: List.generate(
        movies.length,
        (index) => MovieItem(
          movie: movies.elementAt(index),
        ),
      ),
    );
  }
}

/*Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 4.0, top: 24.0, right: 4.0, bottom: 8.0),
            child: Text(
              header,
              style: const TextStyle(
                color: TextColor,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) => MovieItem(
                movie: movies.elementAt(index),
                isSmall: isSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
