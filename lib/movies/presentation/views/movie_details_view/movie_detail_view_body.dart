import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_detail_app_bar.dart';

import '../../controller/movie_details_bloc/movie_details_bloc.dart';
import 'more_like_this_text.dart';
import 'movie_detail_duration.dart';
import 'movie_detail_date_release.dart';
import 'movie_detail_over_view.dart';
import 'movie_detail_rating.dart';
import 'movie_detail_title.dart';
import 'movie_details_genres.dart';
import 'similar_movies_section.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case RequestState.loaded:
            final movie = state.movieDetails;
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                MovieDetailsAppBar(movie: movie),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MovieDetailsTitle(movie: movie),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              MovieDetailsDateRelease(movie: movie),
                              const SizedBox(width: 16.0),
                              MovieDetailsRating(movie: movie),
                              const SizedBox(width: 16.0),
                              MovieDetailsDuration(movie: movie),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          MovieDetailsOverView(movie: movie),
                          const SizedBox(height: 16),
                          MovieDetailsGenres(movie: movie),
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: MoreLikeThisText(),
                ),
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                  sliver: SimilarMoviesSection(),
                ),
              ],
            );

          case RequestState.error:
            return Center(
              child: Text(state.movieDetailsMessage),
            );
        }
      },
    );
  }
}
