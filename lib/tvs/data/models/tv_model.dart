import 'package:movies_app/tvs/domain/entities/tv_entity.dart';

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
      id: json['id'],
      title: json['name'],
      backdropPath: json['backdrop_path'] ?? '',
      posterPath: json['poster_path'] ?? '',
      firstAirTime: json['first_air_date'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
    );
  }
}
