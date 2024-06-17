import 'package:movies_app/movies/domain/entities/similar_movies_entity.dart';

class SimilarMoviesModel extends SimilarMoviesEntity {
  const SimilarMoviesModel({
    required super.movieId,
    required super.backdropPath,
  });

  factory SimilarMoviesModel.fromJson(Map<String, dynamic> json) {
    return SimilarMoviesModel(
      movieId: json['id'],
      backdropPath: json['backdrop_path'],
    );
  }
}
