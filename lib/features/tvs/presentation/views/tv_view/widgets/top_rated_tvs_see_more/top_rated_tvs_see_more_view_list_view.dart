import 'package:flutter/material.dart';

import '../../../../../../../core/utils/custom_widgets/see_more_widgets/see_more_view_item.dart';
import '../../../../../domain/entities/tv_entity.dart';
import '../../../tv_details_view/tv_details_view.dart';

class TopRatedTvsSeeMoreListView extends StatelessWidget {
  const TopRatedTvsSeeMoreListView({
    super.key,
    required this.list,
  });

  final List<TvEntity> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        TvEntity item = list[index];

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TvDetailView(
                  id: list[index].id,
                ),
              ),
            );
          },
          child: SeeMoreViewItem(
            title: item.title,
            posterPath: item.posterPath,
            overview: item.overview,
            releaseDate: item.firstAirTime,
            voteAverage: item.voteAverage.toDouble(),
          ),
        );
      },
    );
  }
}
