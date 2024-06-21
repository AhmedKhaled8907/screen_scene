import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/global/entities/genres_entity.dart';

class DetailsGenres extends StatelessWidget {
  const DetailsGenres({
    super.key,
    required this.genres,
  });

  final List<GenresEntity> genres;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppString.genres}: ${_showGenres(genres)}',
      style: getMediumStyle(
        fontSize: FontSize.s14,
        letterSpacing: AppSize.s1_25,
      ),
    );
  }

  String _showGenres(List<GenresEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(
      0,
      result.length - AppSize.s2.toInt(),
    );
  }
}
