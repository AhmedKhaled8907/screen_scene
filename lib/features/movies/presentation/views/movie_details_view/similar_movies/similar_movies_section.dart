import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/global/resources/constants_manager.dart';
import '../../../../../../core/global/resources/values_manager.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../controller/similar_movies_bloc/similar_movies_bloc.dart';
import '../../../../../../core/utils/custom_widgets/custom_loading_indicator.dart';
import '../../../../../../core/utils/custom_widgets/poster_image.dart';

import '../movie_details_view.dart';

class SimilarMoviesSection extends StatelessWidget {
  const SimilarMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
      builder: (context, state) {
        switch (state.similarMoviesState) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: CustomLoadingIndicator(
                height: AppSize.s170,
              ),
            );

          case RequestState.loaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: state.similarMovies.length,
                (context, index) {
                  final similarMoviesItem = state.similarMovies[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MovieDetailView(
                            id: similarMoviesItem.movieId,
                          ),
                        ),
                      );
                    },
                    child: FadeInUp(
                      from: AppConstants.fromFadeInUp,
                      duration: const Duration(
                        milliseconds: AppDuration.d500,
                      ),
                      child: PosterImage(
                        posterPath: similarMoviesItem.posterPath!,
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
              child: Text(state.similarMoviesMessage),
            );
        }
      },
    );
  }
}

class BlackBorder extends StatelessWidget {
  const BlackBorder({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: AppSize.s0_5,
        ),
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      child: child,
    );
  }
}
