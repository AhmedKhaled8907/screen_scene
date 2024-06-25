import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String? backdropPath;
  final String posterPath;
  final String overview;
  final num voteAverage;
  final String releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    this.backdropPath,
    required this.posterPath,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      backdropPath,
      posterPath,
      overview,
      voteAverage,
      releaseDate,
    ];
  }
}
