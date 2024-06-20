import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular_see_more/dummy.dart';

import 'popular_see_more_view_item.dart';

class PopularSeeMoreViewBody extends StatelessWidget {
  const PopularSeeMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DummyModel> list = dummyList;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return PopularSeeMoreViewItem(dummy: list[index]);
      },
    );
  }
}
