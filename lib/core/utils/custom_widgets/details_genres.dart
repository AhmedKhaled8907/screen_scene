import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/global/entities/genres_entity.dart';
import 'package:movies_app/core/utils/custom_widgets/details_genres_List_view.dart';

class DetailsGenres extends StatelessWidget {
  const DetailsGenres({
    super.key,
    required this.genres,
  });

  final List<GenresEntity> genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${AppString.genres}:',
            style: getMediumStyle(
              fontSize: FontSize.s16,
              letterSpacing: AppSize.s1_25,
            )),
        const SizedBox(width: AppSize.s8),
        DetailsGenresListView(genres: genres),
      ],
    );
  }
}
