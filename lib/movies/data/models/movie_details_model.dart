import 'package:movies_app/movies/data/models/genres_model.dart';

import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    super.backdropPath,
    super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        /// TODO: check if this is correct
        backdropPath:
            json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
        genres: List<GenresModel>.from(
          json['genres'].map((x) => GenresModel.fromJson(x)),
        ),
        id: json["id"],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'],
      );
}
