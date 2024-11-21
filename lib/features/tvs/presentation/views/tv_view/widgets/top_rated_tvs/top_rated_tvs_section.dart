import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/see_more_widgets/title_and_see_more.dart';
import 'package:screen_scene/features/tvs/presentation/views/tv_view/widgets/top_rated_tvs_see_more/top_rated_tvs_see_more_view.dart';

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
