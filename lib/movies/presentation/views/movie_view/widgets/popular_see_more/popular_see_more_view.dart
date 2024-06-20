import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';

import 'popular_see_more_view_body.dart';

class PopularSeeMoreView extends StatelessWidget {
  const PopularSeeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const PopularSeeMoreViewBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        AppString.popularMovies,
        style: getBoldStyle(),
      ),
      centerTitle: true,
    );
  }
}



