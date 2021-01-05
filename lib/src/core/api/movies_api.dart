import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/src/core/api/i_movies_api.dart';
import 'package:movie_app/src/core/constants/constants.dart';
import 'package:movie_app/src/core/models/models.dart';

class MoviesApi implements IMoviesApi {
  MoviesApi();

  Dio dioClient = Dio();
  Logger logger = Logger();

  @override
  Future<RequestResult<ResultModel>> getMovies(String filter) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'api_key': API_KEY,
      'language': 'en-US',
      'page': 1
    };
    final String url = '$MOVIES$filter?';
    String errorMessage = '';

    try {
      final response = await dioClient.get(url, queryParameters: query);
      if (response.statusCode == 200) {
        final ResultModel<Movie> resultMovies =
            ResultModel.fromJson(response.data);
        dioClient.close();
        return RequestResult<ResultModel<Movie>>(
          success: true,
          status: response.statusCode,
          data: resultMovies,
        );
      } else {
        dioClient.close();
        return RequestResult<ResultModel<Movie>>(
          success: false,
          status: response.statusCode,
          error: response.statusMessage,
        );
      }
    } on DioError catch (e) {
      if (e.response != null) {
        logger.e(e.response);
        errorMessage = e.message;
      }
    } catch (e) {
      logger.e(e.error);
      errorMessage = e.error;
    }
    dioClient.close();
    return RequestResult<ResultModel>(success: false, error: errorMessage);
  }
}
