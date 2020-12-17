part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesStateLoading extends MoviesState {}

class MoviesStateLoaded extends MoviesState {
  const MoviesStateLoaded({
    @required this.movies,
    @required this.type,
  });

  final List<Movie> movies;
  final String type;

  @override
  List<Object> get props => [movies, type];
}

class MoviesStateFailure extends MoviesState {
  const MoviesStateFailure({this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
