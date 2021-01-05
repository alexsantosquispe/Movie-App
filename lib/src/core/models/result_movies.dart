import 'package:movie_app/src/core/models/models.dart';
import 'package:movie_app/src/core/models/tv_show.dart';

class ResultModel<T> {
  ResultModel({this.page, this.results, this.totalPages, this.totalResults});

  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  // ignore: sort_constructors_first
  factory ResultModel.fromJson(Map<String, dynamic> json) {
    final List<T> results = [];
    final Type type = T.runtimeType;
    try {
      if (json['results'] != null) {
        if (type == Movie) {
          json['results'].forEach((item) {
            results.add(Movie.fromJson(item) as T);
          });
        } else {
          json['results'].forEach((item) {
            results.add(TvShow.fromJson(item) as T);
          });
        }
      }
      return ResultModel<T>(
        page: json['page'],
        results: results,
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
    } catch (e) {
      print(e.error);
    }
    return ResultModel();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    final Type type = T.runtimeType;

    data['page'] = page;
    if (results != null) {
      data['results'] = results.map((T item) {
        if (type == Movie) {
          return (item as Movie).toJson();
        } else {
          return (item as TvShow).toJson();
        }
      }).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
