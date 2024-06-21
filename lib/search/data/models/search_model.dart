import 'package:movies_app/search/domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.overview,
    required super.releaseDate,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      title: json['title'] ?? json['name'],
      posterPath: json['poster_path'] ?? json['profile_path'],
      releaseDate: json['release_date'] ?? json['first_air_date'] ?? '',
      overview: json['overview'] ?? '',
    );
  }
}
