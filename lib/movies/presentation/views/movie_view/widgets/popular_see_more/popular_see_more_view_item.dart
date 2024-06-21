import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/core/utils/custom_widgets/details_date_release.dart';
import 'package:movies_app/core/utils/custom_widgets/details_rating.dart';
import 'package:movies_app/core/utils/custom_widgets/movie_see_more_title.dart';
import 'package:movies_app/core/utils/custom_widgets/poster_image.dart';

import 'package:movies_app/core/utils/custom_widgets/see_more_over_view_text.dart';

import '../../../../../../core/global/resources/values_manager.dart';

class PopularSeeMoreViewItem extends StatelessWidget {
  const PopularSeeMoreViewItem({
    super.key,
    required this.model,
  });

  final MovieEntity model;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: AppDuration.d500),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s4,
          vertical: AppSize.s4,
        ),
        child: IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p8,
              horizontal: AppPadding.p4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r8),
              color: Colors.grey[AppColorShades.colorShade800],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PosterImage(posterPath: model.posterPath),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSize.s8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieSeeMoreTitle(title: model.title),
                        const SizedBox(height: AppSize.s16),
                        Row(
                          children: [
                            DetailsDateRelease(releaseDate: model.releaseDate),
                            const SizedBox(width: AppSize.s16),
                            Rating(
                              voteAverage: model.voteAverage.toDouble(),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),
                        SeeMoreOverViewText(overView: model.overview),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
