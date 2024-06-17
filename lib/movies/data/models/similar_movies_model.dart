import 'package:movies_app/movies/domain/entities/similar_movies_entity.dart';

class SimilarMoviesModel extends SimilarMoviesEntity {
  const SimilarMoviesModel({
    required super.movieId,
    required super.posterPath,
  });

  factory SimilarMoviesModel.fromJson(Map<String, dynamic> json) {
    return SimilarMoviesModel(
      movieId: json['id'],

      /// TODO: check if this is correct

      posterPath: json['poster_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',
    );
  }
}
