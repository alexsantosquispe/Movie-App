import 'package:movie_app/src/core/models/models.dart';

abstract class IMoviesService {
  /// Gets a list of mivies
  Future<RequestResult<ResultMovies>> fetchMovies(String filter);
}
