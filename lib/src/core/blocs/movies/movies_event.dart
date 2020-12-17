part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchMovies extends MoviesEvent {
  const FetchMovies({this.filter});

  final String filter;

  @override
  List<Object> get props => [filter];
}
