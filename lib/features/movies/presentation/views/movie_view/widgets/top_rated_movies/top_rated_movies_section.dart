import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/see_more_widgets/title_and_see_more.dart';
import 'package:movies_app/features/movies/presentation/views/movie_view/widgets/top_rated_movies/top_rated_movies_components.dart';

import '../top_rated_movies_see_more/top_rated_movies_see_more_view.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeMore(
          title: AppString.topRated,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TopRatedMoviesSeeMoreView(),
              ),
            );
          },
        ),
        const TopRatedMoviesComponents(),
      ],
    );
  }
}
