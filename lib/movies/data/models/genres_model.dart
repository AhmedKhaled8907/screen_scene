import '../../domain/entities/genres_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({
    super.movieId,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        movieId: json['movie_id'] ?? 0,
        name: json['name'],
      );
}
