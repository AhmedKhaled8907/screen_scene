import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';

import 'popular_movies_see_more_view_body.dart';

class PopularMoviesSeeMoreView extends StatelessWidget {
  const PopularMoviesSeeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSeeMoreAppBar(title: AppString.popularMovies),
      body: const PopularMoviesSeeMoreViewBody(),
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
