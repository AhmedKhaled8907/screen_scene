import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_details_view.dart';

import 'popular_see_more_view_item.dart';

class PopularSeeMoreListView extends StatelessWidget {
  const PopularSeeMoreListView({
    super.key,
    required this.list,
  });

  final List<MovieEntity> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            /// TODO : NAVIGATION TO MOVIE DETAILS
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieDetailView(
                  id: list[index].id,
                ),
              ),
            );
          },
          child: PopularSeeMoreViewItem(
            model: list[index],
          ),
        );
      },
    );
  }
}
