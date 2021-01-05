import 'package:movie_app/src/core/models/models.dart';

abstract class IMoviesService {
  /// Gets a list of mivies
  Future<RequestResult<ResultModel>> fetchMovies(String filter);
}
