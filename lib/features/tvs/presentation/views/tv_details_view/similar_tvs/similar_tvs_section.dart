import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/global/resources/constants_manager.dart';
import '../../../../../../core/global/resources/values_manager.dart';
import '../../../../../../core/utils/custom_widgets/custom_loading_indicator.dart';
import '../../../../../../core/utils/custom_widgets/poster_image.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../controller/tv_details_bloc/similar_tvs_bloc/similar_tvs_bloc.dart';
import '../tv_details_view.dart';

class SimilarTvsSection extends StatelessWidget {
  const SimilarTvsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarTvsBloc, SimilarTvsState>(
      builder: (context, state) {
        switch (state.similarTvsState) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: CustomLoadingIndicator(
                height: AppSize.s170,
              ),
            );

          case RequestState.loaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: state.similarTvs.length,
                (context, index) {
                  final similarTvsItem = state.similarTvs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => TvDetailView(
                          id: similarTvsItem.id,
                        ),
                      ));
                    },
                    child: FadeInUp(
                      from: AppConstants.fromFadeInUp,
                      duration: const Duration(
                        milliseconds: AppDuration.d500,
                      ),
                      child: PosterImage(
                        posterPath: similarTvsItem.posterPath!,
                      ),
                    ),
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: AppConstants.mainAxisSpacing,
                crossAxisSpacing: AppConstants.crossAxisSpacing,
                childAspectRatio: AppConstants.childAspectRatio,
                crossAxisCount: AppConstants.crossAxisCount,
              ),
            );

          case RequestState.error:
            return Center(
              child: Text(state.similarTvsMessage),
            );
        }
      },
    );
  }
}
