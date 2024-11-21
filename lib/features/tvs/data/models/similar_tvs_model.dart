import 'package:screen_scene/core/global/resources/api_constants_manager.dart';
import 'package:screen_scene/features/tvs/domain/entities/similar_tvs_entity.dart';

class SimilarTvsModel extends SimilarTvsEntity {
  const SimilarTvsModel({
    required super.id,
    required super.posterPath,
  });

  factory SimilarTvsModel.fromJson(Map<String, dynamic> json) {
    return SimilarTvsModel(
      id: json[AppJson.id],
      posterPath: json[AppJson.posterPath] ?? '',
    );
  }
}
