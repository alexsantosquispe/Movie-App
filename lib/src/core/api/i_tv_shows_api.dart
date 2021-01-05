import 'package:movie_app/src/core/models/models.dart';

abstract class ITvShowsApi {
  /// Gets the tv shows with a filter
  Future<RequestResult<ResultModel>> getTvShows(String filter);
}
