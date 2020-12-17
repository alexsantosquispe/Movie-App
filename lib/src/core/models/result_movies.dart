import 'package:movie_app/src/core/models/models.dart';

class ResultMovies {
  ResultMovies({this.page, this.movies, this.totalPages, this.totalResults});

  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  // ignore: sort_constructors_first
  factory ResultMovies.fromJson(Map<String, dynamic> json) {
    final List<Movie> movies = [];
    try {
      if (json['results'] != null) {
        json['results'].forEach((item) {
          movies.add(Movie.fromJson(item));
        });
      }
      return ResultMovies(
        page: json['page'],
        movies: movies,
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
    } catch (e) {
      print(e.error);
    }
    return ResultMovies();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['page'] = page;
    if (movies != null) {
      data['results'] = movies.map((Movie item) => item.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
