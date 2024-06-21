import '../entities/genres_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({
    super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'] ?? 0,
        name: json['name'],
      );
}
