import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/see_more_widgets/title_and_see_more.dart';
import 'package:movies_app/tvs/presentation/views/tv_view/widgets/popular_tvs_see_more/popular_tvs_see_more_view.dart';

import 'popular_tvs_components.dart';

class PopularTvsSection extends StatelessWidget {
  const PopularTvsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndSeeMore(
          title: AppString.popular,
          onTap: () {
            /// TODO : NAVIGATION TO POPULAR SCREEN
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PopularTvsSeeMoreView(),
            ));
          },
        ),
        const PopularTvsComponents(),
      ],
    );
  }
}
