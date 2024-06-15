import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    // required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdropPath'] ?? '',
      // genreIds: List<int>.from(json['genreIds'].map((e) => e)) ?? [],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
    );
  }
}
