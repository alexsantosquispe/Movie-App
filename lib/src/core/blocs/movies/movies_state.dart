part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesStateLoading extends MoviesState {}

class MoviesStateLoaded extends MoviesState {
  const MoviesStateLoaded({@required this.movies});

  final List<Movie> movies;

  @override
  List<Object> get props => [movies];
}

class MoviesStateFailure extends MoviesState {
  const MoviesStateFailure({this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
