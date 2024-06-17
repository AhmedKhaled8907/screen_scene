import 'package:equatable/equatable.dart';

class SimilarMoviesEntity extends Equatable {
  final int movieId;
  final String? posterPath;

  const SimilarMoviesEntity({
    required this.movieId,
    this.posterPath,
  });

  @override
  List<Object?> get props => [
        movieId,
        posterPath,
      ];
}
