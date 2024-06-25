import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/entities/genres_entity.dart';

class TvDetailsEntity extends Equatable {
  final String? backdropPath;
  final List<GenresEntity>? genres;
  final int id;
  final String overview;
  final String firstAirDate;
  final String title;
  final double voteAverage;
  final int numOfSeasons;
  final int numOfEpisodes;

  const TvDetailsEntity({
    this.backdropPath,
    this.genres,
    required this.id,
    required this.overview,
    required this.firstAirDate,
    required this.title,
    required this.voteAverage,
    required this.numOfSeasons,
    required this.numOfEpisodes,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        overview,
        firstAirDate,
        title,
        voteAverage,
        numOfEpisodes,
        numOfSeasons,
      ];
}
