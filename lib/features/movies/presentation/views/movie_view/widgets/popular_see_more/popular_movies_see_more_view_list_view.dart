import 'package:flutter/material.dart';
import 'package:screen_scene/features/movies/domain/entities/movie_entity.dart';
import 'package:screen_scene/features/movies/presentation/views/movie_details_view/movie_details_view.dart';

import '../../../../../../../core/utils/custom_widgets/see_more_widgets/see_more_items.dart';

class PopularMoviesSeeMoreListView extends StatelessWidget {
  const PopularMoviesSeeMoreListView({
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
        MovieEntity item = list[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MovieDetailView(
                  id: list[index].id,
                ),
              ),
            );
          },
          child: SeeMoreItems(
            title: item.title,
            posterPath: item.posterPath,
            overview: item.overview,
            releaseDate: item.releaseDate,
            voteAverage: item.voteAverage.toDouble(),
          ),
        );
      },
    );
  }
}
