class TvShow {
  TvShow(
      {this.backdropPath,
      this.firstAirDate,
      this.id,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount});

  final String backdropPath;
  final String firstAirDate;
  final int id;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;

  // ignore: sort_constructors_first
  factory TvShow.fromJson(Map<String, dynamic> json) {
    try {
      return TvShow(
        backdropPath: json['backdrop_path'],
        firstAirDate: json['first_air_date'],
        id: json['id'],
        name: json['name'],
        originalLanguage: json['original_language'],
        originalName: json['original_name'],
        overview: json['overciew'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
    } catch (e) {
      print(e.error);
    }
    return TvShow();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['first_air_date'] = firstAirDate;
    data['id'] = id;
    data['name'] = name;
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
