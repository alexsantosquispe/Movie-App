import 'package:movie_app/src/core/models/models.dart';

abstract class IMoviesApi {
  /// Gets the movies filtered
  Future<RequestResult<ResultModel>> getMovies(String filter);
}
