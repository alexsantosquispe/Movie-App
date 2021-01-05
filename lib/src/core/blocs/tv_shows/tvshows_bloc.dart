import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/models/models.dart';

part 'tvshows_event.dart';
part 'tvshows_state.dart';

class TvshowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  TvshowsBloc() : super(TvShowsInitial());

  @override
  Stream<TvShowsState> mapEventToState(TvShowsEvent event) async* {
    if (event is FetchTvShows) {
      yield TvShowsStateLoading();
      try {
        // yield TvShowsStateLoaded();
      } catch (e) {
        yield TvShowsStateFailure(error: e.error);
      }
    }
  }
}
