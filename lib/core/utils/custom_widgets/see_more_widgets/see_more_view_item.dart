import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/details_widgets/details_date_release.dart';
import 'package:screen_scene/core/utils/custom_widgets/see_more_widgets/see_more_rating.dart';
import 'package:screen_scene/core/utils/custom_widgets/see_more_widgets/see_more_title.dart';
import 'package:screen_scene/core/utils/custom_widgets/poster_image.dart';

import 'package:screen_scene/core/utils/custom_widgets/see_more_widgets/see_more_over_view_text.dart';

import '../../../global/resources/values_manager.dart';

class SeeMoreViewItem extends StatelessWidget {
  const SeeMoreViewItem({
    super.key,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
  });

  final String title, posterPath, overview, releaseDate;
  final double voteAverage;

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
                PosterImage(posterPath: posterPath),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSize.s8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SeeMoreTitle(title: title),
                        const SizedBox(height: AppSize.s16),
                        Row(
                          children: [
                            DetailsDateRelease(releaseDate: releaseDate),
                            const SizedBox(width: AppSize.s16),
                            SeeMoreRating(
                              voteAverage: voteAverage.toDouble(),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),
                        SeeMoreOverViewText(overView: overview),
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
