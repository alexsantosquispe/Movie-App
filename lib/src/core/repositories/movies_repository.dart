import 'package:movie_app/src/core/api/apis.dart';
import 'package:movie_app/src/core/models/models.dart';
import 'package:movie_app/src/core/repositories/repositories.dart';
import 'package:movie_app/src/core/services/services.dart';

class MoviesRepository implements IMoviesRepository {
  MoviesRepository();

  @override
  Future<RequestResult<ResultModel>> fecthMovies(String filter) async {
    final moviesApi = serviceLocator<IMoviesApi>();
    return await moviesApi.getMovies(filter);
  }
}
