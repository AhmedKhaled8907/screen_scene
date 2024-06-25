import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/utils/models/genres_model.dart';
import 'package:movies_app/features/tvs/domain/entities/tv_details_entity.dart';

class TvDetailsModel extends TvDetailsEntity {
  const TvDetailsModel({
    super.backdropPath,
    super.genres,
    required super.id,
    required super.overview,
    required super.firstAirDate,
    required super.title,
    required super.voteAverage,
    required super.numOfSeasons,
    required super.numOfEpisodes,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        backdropPath: json[AppJson.backdropPath] ?? '',
        id: json[AppJson.id],
        genres: List<GenresModel>.from(
          json[AppJson.genres].map((x) => GenresModel.fromJson(x)),
        ),
        overview: json[AppJson.overview],
        firstAirDate: json[AppJson.firstAirDate],
        title: json[AppJson.name],
        voteAverage: json[AppJson.voteAverage],
        numOfSeasons: json[AppJson.numOfSeasons],
        numOfEpisodes: json[AppJson.numOfEpisodes],
      );
}
