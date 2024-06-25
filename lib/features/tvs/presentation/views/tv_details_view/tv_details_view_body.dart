import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_app_bar.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_date_release.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_genres.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_num_of.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_title.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_over_view.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_rating.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/more_like_this_text.dart';
import 'package:movies_app/features/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';
import 'package:movies_app/features/tvs/presentation/views/tv_details_view/similar_tvs/similar_tvs_section.dart';

class TvDetailsViewBody extends StatelessWidget {
  const TvDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        switch (state.tvDetailsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.white,
              ),
            );

          case RequestState.loaded:
            final tv = state.tvDetails;
            return CustomScrollView(
              key: const Key(AppString.tvDetailScrollViewKey),
              slivers: [
                DetailsAppBar(posterPath: tv!.backdropPath!),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: FadeInUp(
                      from: AppConstants.fromFadeInUp,
                      duration: const Duration(
                        milliseconds: AppDuration.d500,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailsTitle(
                            title: tv.title,
                          ),
                          const SizedBox(height: AppSize.s8),
                          Row(
                            children: [
                              DetailsDateRelease(
                                releaseDate: tv.firstAirDate,
                              ),
                              const SizedBox(width: AppSize.s16),
                              Rating(
                                voteAverage: tv.voteAverage,
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.s16),
                          DetailsOverView(
                            overview: tv.overview,
                          ),
                          const SizedBox(height: AppSize.s16),
                          DetailsNumOf(
                            title: AppString.seasons,
                            numOf: tv.numOfSeasons.toString(),
                          ),
                          const SizedBox(height: AppSize.s8),
                          DetailsNumOf(
                            title: AppString.episodes,
                            numOf: tv.numOfEpisodes.toString(),
                          ),
                          const SizedBox(height: AppSize.s16),
                          DetailsGenres(genres: tv.genres!),
                        ],
                      ),
                    ),
                  ),
                ),
                const MoreLikeThisText(),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    AppSize.s16,
                    AppSize.s0,
                    AppSize.s16,
                    AppSize.s24,
                  ),
                  sliver: SimilarTvsSection(),
                ),
              ],
            );

          case RequestState.error:
            return Center(
              child: Text(state.tvDetailsMessage),
            );
        }
      },
    );
  }
}
