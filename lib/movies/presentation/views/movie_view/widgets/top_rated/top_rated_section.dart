import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/title_and_see_more.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/top_rated/top_rated_components.dart';




class TopRatedSection extends StatelessWidget {
  const TopRatedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeMore(
          title: AppString.topRated,
          onTap: () {
            /// TODO : NAVIGATION TO TOP RATED SCREEN
          },
        ),
        const TopRatedComponents(),
      ],
    );
  }
}