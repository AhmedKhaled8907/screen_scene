import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_rating.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_results_text.dart';

import '../../../../../core/global/resources/values_manager.dart';
import '../../../../../core/utils/custom_widgets/details_widgets/details_date_release.dart';
import '../../../../../core/utils/custom_widgets/poster_image.dart';

class SearchResultsItem extends StatelessWidget {
  const SearchResultsItem({
    super.key,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  final String title;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: AppDuration.d1),
      child: Column(
        children: [
          const Divider(
            height: AppSize.s1,
            thickness: AppSize.s1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.s120,
                  width: AppSize.s80,
                  child: PosterImage(
                    posterPath: posterPath,
                  ),
                ),
                const SizedBox(width: AppPadding.p16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchResultText(title: title),
                      const SizedBox(height: AppPadding.p4),
                      Row(
                        children: [
                          DetailsDateRelease(
                            releaseDate: releaseDate.toString(),
                          ),
                          const SizedBox(width: AppSize.s16),
                          Rating(
                            voteAverage: voteAverage.toDouble(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: AppSize.s1,
            thickness: AppSize.s1,
          ),
        ],
      ),
    );
  }
}
