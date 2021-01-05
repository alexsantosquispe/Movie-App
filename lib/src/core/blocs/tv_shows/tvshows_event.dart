part of 'tvshows_bloc.dart';

abstract class TvShowsEvent extends Equatable {
  const TvShowsEvent();

  @override
  List<Object> get props => [];
}

class FetchTvShows extends TvShowsEvent {
  const FetchTvShows(this.filter);

  final String filter;

  @override
  List<Object> get props => [filter];
}
