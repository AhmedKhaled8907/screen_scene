import 'package:flutter/material.dart';

import '../../../../../../../core/global/resources/strings_manager.dart';
import '../../../../../../../core/global/resources/styles_manager.dart';
import 'top_rated_tvs_see_more_view_body.dart';

class TopRatedTvsSeeMoreView extends StatelessWidget {
  const TopRatedTvsSeeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const TopRatedTvsSeeMoreViewBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        AppString.topRatedTvs,
        style: getBoldStyle(),
      ),
      centerTitle: true,
    );
  }
}
