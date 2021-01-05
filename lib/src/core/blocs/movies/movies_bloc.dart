import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/models/models.dart';
import 'package:movie_app/src/core/services/services.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial());

  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    if (event is FetchMovies) {
      yield MoviesStateLoading();
      try {
        final moviesService = serviceLocator<IMoviesService>();
        final response = await moviesService.fetchMovies(event.filter);
        if (response.success && response.data != null) {
          yield MoviesStateLoaded(movies: response.data.results);
        } else {
          yield MoviesStateFailure(error: response.error);
        }
      } catch (e) {
        print(e.error);
        yield const MoviesStateFailure(error: 'error loading');
      }
    }
  }
}
