import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';

import '../movie_view/widgets/top_rated/top_rated_components.dart';
import '../movie_view/widgets/top_rated/top_rated_section.dart';

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
