import 'package:movies_app/core/global/models/genres_model.dart';
import 'package:movies_app/tvs/domain/entities/tv_details_entity.dart';

class TvDetailsModel extends TvDetailsEntity {
  const TvDetailsModel({
    super.backdropPath,
    super.genres,
    required super.id,
    required super.overview,
    required super.firstAirTime,
    required super.title,
    required super.voteAverage,
    required super.numOfSeasons,
    required super.numOfEpisodes,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        /// TODO: check if this is correct
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        genres: List<GenresModel>.from(
          json['genres'].map((x) => GenresModel.fromJson(x)),
        ),
        overview: json['overview'],
        firstAirTime: json['first_air_date'],
        title: json['name'],
        voteAverage: json['vote_average'],
        numOfSeasons: json['number_of_seasons'],
        numOfEpisodes: json['number_of_episodes'],
      );
}
