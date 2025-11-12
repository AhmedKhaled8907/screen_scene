import 'package:flutter/material.dart';

import '../../../../../../../core/global/resources/strings_manager.dart';
import '../../../../../../../core/utils/custom_widgets/see_more_widgets/title_and_see_more.dart';
import '../top_rated_tvs_see_more/top_rated_tvs_see_more_view.dart';
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
