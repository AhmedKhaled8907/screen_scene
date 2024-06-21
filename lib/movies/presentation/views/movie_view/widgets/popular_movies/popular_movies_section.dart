import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/custom_widgets/see_more_widgets/title_and_see_more.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular_movies/popular_movies_components.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular_see_more/popular_movies_see_more_view.dart';

import '../../../../../../core/global/resources/strings_manager.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeMore(
          title: AppString.popular,
          onTap: () {
            /// TODO : NAVIGATION TO POPULAR SCREEN
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PopularMoviesSeeMoreView(),
            ));
          },
        ),
        const PopularMoviesComponents(),
      ],
    );
  }
}
