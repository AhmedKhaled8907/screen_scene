// ignore: file_names
import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/details_widgets/details_genres_item.dart';
import 'package:screen_scene/core/utils/entities/genres_entity.dart';

class DetailsGenresListView extends StatelessWidget {
  const DetailsGenresListView({
    super.key,
    required this.genres,
  });

  final List<GenresEntity> genres;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: AppSize.s40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppPadding.p4),
              child: DetailsGenresItem(
                genres: genres[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
