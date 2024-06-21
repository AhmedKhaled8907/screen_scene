import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/see_more_widgets/title_and_see_more.dart';
import 'package:movies_app/tvs/presentation/views/tv_view/widgets/top_rated_tvs_see_more/top_rated_tvs_see_more_view.dart';

import 'top_rated_tvs_components.dart';

class TopRatedTvsSection extends StatelessWidget {
  const TopRatedTvsSection({
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TopRatedTvsSeeMoreView(),
              ),
            );
          },
        ),
        const TopRatedTvsComponents(),
      ],
    );
  }
}
