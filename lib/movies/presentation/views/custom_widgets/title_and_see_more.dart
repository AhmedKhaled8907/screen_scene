import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_strings.dart';

import '../movie_view/top_rated/top_rated_components.dart';
import '../movie_view/top_rated/top_rated_section.dart';

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
