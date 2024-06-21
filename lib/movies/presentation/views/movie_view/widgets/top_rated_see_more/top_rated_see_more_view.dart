import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/top_rated_see_more/top_rated_see_more_view_body.dart';



class TopRatedSeeMoreView extends StatelessWidget {
  const TopRatedSeeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const TopRatedSeeMoreViewBody(),
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


