import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';

class MovieDetailsEntity extends Equatable {
  final String? backdropPath;
  final List<GenresEntity>? genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetailsEntity({
    this.backdropPath,
    this.genres,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}
