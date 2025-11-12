import '../../../../core/global/resources/api_constants_manager.dart';
import '../../../../core/utils/models/genres_model.dart';
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
        backdropPath: json[AppJson.backdropPath] ?? '',
        genres: List<GenresModel>.from(
          json[AppJson.genres].map((x) => GenresModel.fromJson(x)),
        ),
        id: json[AppJson.id],
        overview: json[AppJson.overview],
        releaseDate: json[AppJson.releaseDate],
        runtime: json[AppJson.runtime],
        title: json[AppJson.title],
        voteAverage: json[AppJson.voteAverage],
      );
}
