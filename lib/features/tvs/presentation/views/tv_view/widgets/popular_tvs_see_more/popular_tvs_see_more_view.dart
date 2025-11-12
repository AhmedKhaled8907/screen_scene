import 'package:flutter/material.dart';

import '../../../../../../../core/global/resources/strings_manager.dart';
import '../../../../../../../core/global/resources/styles_manager.dart';
import 'popular_tvs_see_more_view_body.dart';

class PopularTvsSeeMoreView extends StatelessWidget {
  const PopularTvsSeeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSeeMoreAppBar(title: AppString.popularTvs),
      body: const PopularTvsSeeMoreViewBody(),
    );
  }

  PreferredSizeWidget? _buildSeeMoreAppBar({required String title}) {
    return AppBar(
      title: Text(
        title,
        style: getBoldStyle(),
      ),
      centerTitle: true,
    );
  }
}
