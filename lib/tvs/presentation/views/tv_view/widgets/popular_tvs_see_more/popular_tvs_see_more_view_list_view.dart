import 'package:flutter/material.dart';
import 'package:movies_app/tvs/domain/entities/tv_entity.dart';
import 'package:movies_app/tvs/presentation/views/tv_details_view/tv_details_view.dart';

import '../../../../../../core/utils/custom_widgets/see_more_widgets/see_more_items.dart';

class PopularTvsSeeMoreListView extends StatelessWidget {
  const PopularTvsSeeMoreListView({
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
            /// TODO : NAVIGATION TO Tv DETAILS
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TvDetailView(
                  id: list[index].id,
                ),
              ),
            );
          },
          child: Column(
            children: [
              SeeMoreItems(
                title: item.title,
                posterPath: item.posterPath,
                overview: item.overview,
                releaseDate: item.firstAirTime,
                voteAverage: item.voteAverage.toDouble(),
              ),
            ],
          ),
        );
      },
    );
  }
}
