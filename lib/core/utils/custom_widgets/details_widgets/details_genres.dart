import 'package:flutter/material.dart';
import '../../../global/resources/font_manager.dart';
import '../../../global/resources/strings_manager.dart';
import '../../../global/resources/styles_manager.dart';
import '../../../global/resources/values_manager.dart';
import 'details_genres_list_view.dart';
import '../../entities/genres_entity.dart';

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
