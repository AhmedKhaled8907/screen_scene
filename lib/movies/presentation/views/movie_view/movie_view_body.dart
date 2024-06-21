import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/top_rated/top_rated_section.dart';

import 'widgets/now_playing/now_playing_section.dart';
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
          TopRatedSection(),

          SizedBox(height: AppSize.s24),
        ],
      ),
    );
  }
}
