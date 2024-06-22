import 'package:movies_app/core/global/resources/api_constants_manager.dart';

import '../entities/genres_entity.dart';

class GenresModel extends GenresEntity {
  const GenresModel({
    super.id,
    required super.name,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json[AppJson.id] ,
        name: json[AppJson.name],
      );
}
