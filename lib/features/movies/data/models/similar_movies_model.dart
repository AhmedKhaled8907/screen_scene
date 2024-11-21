import 'package:screen_scene/core/global/resources/api_constants_manager.dart';
import 'package:screen_scene/features/movies/domain/entities/similar_movies_entity.dart';

class SimilarMoviesModel extends SimilarMoviesEntity {
  const SimilarMoviesModel({
    required super.movieId,
    required super.posterPath,
  });

  factory SimilarMoviesModel.fromJson(Map<String, dynamic> json) {
    return SimilarMoviesModel(
      movieId: json[AppJson.id],
      posterPath: json[AppJson.posterPath] ?? '',
    );
  }
}
