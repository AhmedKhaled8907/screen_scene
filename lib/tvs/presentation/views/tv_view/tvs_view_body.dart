import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/tvs/presentation/views/tv_view/widgets/on_the_air/on_the_air_section.dart';

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

          // // popular Tvs section
          // PopularSection(),

          // // top rated Tvs section
          // TopRatedSection(),

          SizedBox(height: AppSize.s24),
        ],
      ),
    );
  }
}