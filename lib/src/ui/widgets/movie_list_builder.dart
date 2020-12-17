import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/blocs/blocs.dart';
import 'package:movie_app/src/ui/widgets/widgets.dart';

class MovieListBuilder extends StatefulWidget {
  const MovieListBuilder({Key key, this.title, this.typeSection})
      : super(key: key);

  final String title;
  final String typeSection;

  @override
  _MovieListBuilderState createState() => _MovieListBuilderState();
}

class _MovieListBuilderState extends State<MovieListBuilder> {
  @override
  void initState() {
    super.initState();
    getMovies(widget.typeSection);
  }

  void getMovies(String filter) {
    context.read<MoviesBloc>().add(FetchMovies(filter: filter));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (BuildContext context, MoviesState state) {
        if (state is MoviesStateLoading) {
          return LoadingsIndicator();
        } else if (state is MoviesStateLoaded) {
          return MoviesList(
            header: widget.title,
            movies: state.movies,
            isSmall: false,
          );
        } else if (state is MoviesStateFailure) {
          return ErrorMessage(error: state.error);
        }
        return const Center(child: Text('There is no movies'));
      },
    );
  }
}
