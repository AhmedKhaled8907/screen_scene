import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/custom_loading_indicator.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/poster_image.dart';

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
                child: CustomLoadingIndicator(height: AppSize.s170));

          case RequestState.loaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: state.similarMovies.length,
                (context, index) {
                  final similarMoviesItem = state.similarMovies[index];
                  return InkWell(
                    onTap: () {
                      /// TODO : NAVIGATE TO MOVIE DETAILS
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailView(id: similarMoviesItem.movieId),
                      ));
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
