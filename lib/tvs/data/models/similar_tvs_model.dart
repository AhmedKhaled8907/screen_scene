import 'package:movies_app/tvs/domain/entities/similar_tvs_entity.dart';

class SimilarTvsModel extends SimilarTvsEntity {
  const SimilarTvsModel({
    required super.id,
    required super.posterPath,
  });

  factory SimilarTvsModel.fromJson(Map<String, dynamic> json) {
    return SimilarTvsModel(
      id: json['id'],
      posterPath: json['poster_path'] ?? '',
    );
  }
}
