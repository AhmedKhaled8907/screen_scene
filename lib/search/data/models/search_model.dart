import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/search/domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel({
    required super.id,
    required super.title,
    required super.posterPath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json[AppJson.id],
      title: json[AppJson.title],
      posterPath: json[AppJson.posterPath],
      releaseDate: json[AppJson.releaseDate],
      overview: json[AppJson.overview],
      voteAverage: json[AppJson.voteAverage],
    );
  }
}
