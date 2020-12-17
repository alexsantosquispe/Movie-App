import 'package:movie_app/src/core/models/models.dart';

abstract class IMoviesRepository {
  /// Gets the list of moviesw depending the filter
  Future<RequestResult<ResultMovies>> fecthMovies(String filter);
}
