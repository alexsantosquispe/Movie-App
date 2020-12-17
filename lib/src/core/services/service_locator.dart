import 'package:get_it/get_it.dart';
import 'package:movie_app/src/core/api/apis.dart';
import 'package:movie_app/src/core/repositories/repositories.dart';
import 'package:movie_app/src/core/services/services.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton<IMoviesApi>(() => MoviesApi())
    ..registerLazySingleton<IMoviesRepository>(() => MoviesRepository())
    ..registerLazySingleton<IMoviesService>(() => MoviesService())
    ..registerLazySingleton<IConnectivitySevice>(() => ConnectivityService());
}
