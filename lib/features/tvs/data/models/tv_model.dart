import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/features/tvs/domain/entities/tv_entity.dart';

class TvModel extends TvEntity {
  const TvModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.posterPath,
    required super.overview,
    required super.voteAverage,
    required super.firstAirTime,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json[AppJson.id],
      title: json[AppJson.name],
      backdropPath: json[AppJson.backdropPath] ?? '',
      posterPath: json[AppJson.posterPath] ?? '',
      firstAirTime: json[AppJson.firstAirDate],
      overview: json[AppJson.overview],
      voteAverage: json[AppJson.voteAverage],
    );
  }
}
