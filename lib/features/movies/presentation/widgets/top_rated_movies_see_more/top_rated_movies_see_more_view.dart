import 'package:flutter/material.dart';
import '../../../../../core/global/resources/strings_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import 'top_rated_movies_see_more_view_body.dart';

class TopRatedMoviesSeeMoreView extends StatelessWidget {
  const TopRatedMoviesSeeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const TopRatedMoviesSeeMoreViewBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        AppString.topRatedMovies,
        style: getBoldStyle(),
      ),
      centerTitle: true,
    );
  }
}
