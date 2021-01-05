import 'package:movie_app/src/core/models/models.dart';
import 'package:movie_app/src/core/repositories/repositories.dart';
import 'package:movie_app/src/core/services/services.dart';

class MoviesService implements IMoviesService {
  MoviesService();

  @override
  Future<RequestResult<ResultModel>> fetchMovies(String filter) async {
    final moviesRepository = serviceLocator<IMoviesRepository>();
    final response = await moviesRepository.fecthMovies(filter);
    return response;
  }
}
