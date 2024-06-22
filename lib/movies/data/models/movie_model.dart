import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.posterPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json[AppJson.id],
      title: json[AppJson.title],
      backdropPath: json[AppJson.backdropPath] ?? '',
      posterPath: json[AppJson.posterPath] ?? '',
      releaseDate: json[AppJson.releaseDate] ?? '',
      overview: json[AppJson.overview] ?? '',
      voteAverage: json[AppJson.voteAverage] ?? 0.0,
    );
  }
}
