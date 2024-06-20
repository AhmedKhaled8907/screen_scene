import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/movie_date_release.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/movie_rating.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/movie_see_more_tilte.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/poster_image.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular_see_more/dummy.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular_see_more/see_more_over_view_text.dart';


import '../../../../../../core/global/resources/values_manager.dart';

class PopularSeeMoreViewItem extends StatelessWidget {
  const PopularSeeMoreViewItem({
    super.key,
    required this.dummy,
  });

  final DummyModel dummy;

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
                PosterImage(posterPath: dummy.image),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSize.s8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieSeeMoreTitle(dummy: dummy),
                        const SizedBox(height: AppSize.s16),
                        Row(
                          children: [
                            MovieDateRelease(releaseDate: dummy.releaseDate),
                            const SizedBox(width: AppSize.s16),
                            MovieRating(
                              voteAverage: dummy.voteAverage.toDouble(),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),
                        SeeMoreOverViewText(dummy: dummy),
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
