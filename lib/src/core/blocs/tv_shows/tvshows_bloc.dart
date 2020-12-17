import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tvshows_event.dart';
part 'tvshows_state.dart';

class TvshowsBloc extends Bloc<TvshowsEvent, TvshowsState> {
  TvshowsBloc() : super(TvshowsInitial());

  @override
  Stream<TvshowsState> mapEventToState(
    TvshowsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
