import 'package:equatable/equatable.dart';

class SimilarMoviesEntity extends Equatable {
  final int movieId;
  final String backdropPath;

  const SimilarMoviesEntity({
    required this.movieId,
    required this.backdropPath,
  });

  @override
  List<Object> get props => [
        movieId,
        backdropPath,
      ];
}
