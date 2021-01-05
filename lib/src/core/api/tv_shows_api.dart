import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/src/core/api/i_tv_shows_api.dart';
import 'package:movie_app/src/core/constants/api_constants.dart';
import 'package:movie_app/src/core/models/models.dart';

class TvShowsApi implements ITvShowsApi {
  TvShowsApi();

  Dio dioClient = Dio();
  Logger logger = Logger();

  @override
  Future<RequestResult<ResultModel>> getTvShows(String filter) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'api_key': API_KEY,
      'language': 'en-US',
      'page': 1
    };
    final String url = '$TV$filter?';
    String errorMessage = '';

    try {
      final response = await dioClient.get(url, queryParameters: query);
      if (response.statusCode == 200) {
        final ResultModel<TvShow> resultTvShows =
            ResultModel.fromJson(response.data);
        dioClient.close();
        return RequestResult<ResultModel<TvShow>>(
          success: true,
          status: response.statusCode,
          data: resultTvShows,
        );
      } else {
        dioClient.close();
        return RequestResult<ResultModel<TvShow>>(
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
