import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/features/tvs/presentation/views/tv_view/widgets/on_the_air_tvs/on_the_air_section.dart';

import 'widgets/popular_tvs/popular_tvs_section.dart';
import 'widgets/top_rated_tvs/top_rated_tvs_section.dart';

class TvsViewBody extends StatelessWidget {
  const TvsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      key: Key(AppString.tvScrollViewKey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // on the air Tvs section
          OnTheAirSection(),

          // popular Tvs section
          PopularTvsSection(),

          // // top rated Tvs section
          TopRatedTvsSection(),

          SizedBox(height: AppSize.s24),
        ],
      ),
    );
  }
}
