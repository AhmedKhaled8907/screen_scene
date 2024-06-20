import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular/popular_components.dart';

import '../../../../../../core/global/resources/strings_manager.dart';
import '../top_rated/top_rated_section.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeMore(
          title: AppString.popular,
          onTap: () {
            /// TODO : NAVIGATION TO POPULAR SCREEN
          },
        ),
        const PopularComponents(),
      ],
    );
  }
}
