part of 'tvshows_bloc.dart';

abstract class TvShowsState extends Equatable {
  const TvShowsState();

  @override
  List<Object> get props => [];
}

class TvShowsInitial extends TvShowsState {}

class TvShowsStateLoading extends TvShowsState {}

class TvShowsStateLoaded extends TvShowsState {
  const TvShowsStateLoaded({@required this.tvShows});

  final List<TvShow> tvShows;

  @override
  List<Object> get props => [tvShows];
}

class TvShowsStateFailure extends TvShowsState {
  const TvShowsStateFailure({this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
