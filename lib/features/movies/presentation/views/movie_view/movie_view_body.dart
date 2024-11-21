import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/features/movies/presentation/views/movie_view/widgets/top_rated_movies/top_rated_movies_section.dart';

import 'widgets/now_playing_movies/now_playing_section.dart';
import 'widgets/popular_movies/popular_movies_section.dart';

class MovieViewBody extends StatelessWidget {
  const MovieViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      key: Key(AppString.movieScrollViewKey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Now Playing movies section
          NowPlayingSection(),

          // popular movies section
          PopularMoviesSection(),

          // top rated movies section
          TopRatedMoviesSection(),

          SizedBox(height: AppSize.s24),
        ],
      ),
    );
  }
}
