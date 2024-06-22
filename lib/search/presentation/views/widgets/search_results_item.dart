import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/details_widgets/details_rating.dart';
import 'package:movies_app/search/presentation/views/widgets/search_results_text.dart';

import '../../../../core/global/resources/values_manager.dart';
import '../../../../core/utils/custom_widgets/details_widgets/details_date_release.dart';
import '../../../../core/utils/custom_widgets/poster_image.dart';
import '../../../domain/entities/search_entity.dart';

class SearchResultsItem extends StatelessWidget {
  const SearchResultsItem({
    super.key,
    required this.searchEntity,
  });

  final SearchEntity searchEntity;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: AppDuration.d1),
      child: Column(
        children: [
          const Divider(
            height: AppSize.s1,
            thickness: AppSize.s1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppSize.s120,
                  width: AppSize.s80,
                  child: PosterImage(
                    posterPath: searchEntity.posterPath,
                  ),
                ),
                const SizedBox(width: AppPadding.p16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchResultText(searchEntity: searchEntity),
                      const SizedBox(height: AppPadding.p4),
                      Row(
                        children: [
                          DetailsDateRelease(
                            releaseDate: searchEntity.releaseDate.toString(),
                          ),
                          const SizedBox(width: AppSize.s16),
                          Rating(
                            voteAverage: searchEntity.voteAverage.toDouble(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: AppSize.s1,
            thickness: AppSize.s1,
          ),
        ],
      ),
    );
  }
}

class SearchTitleListView extends StatefulWidget {
  const SearchTitleListView({super.key});

  @override
  SearchTitleListViewState createState() => SearchTitleListViewState();
}

class SearchTitleListViewState extends State<SearchTitleListView> {
  int _selectedIndex = 0;

  final List<String> items = ["Movies", "TVs", "People"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.white),
              color:
                  _selectedIndex == index ? AppColors.gold : Colors.transparent,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p2,
              horizontal: AppPadding.p8,
            ),
            margin: const EdgeInsets.symmetric(
              // vertical: AppMargin.m2,
              horizontal: AppMargin.m8,
            ),
            child: Center(
              child: Text(
                items[index],
                style: getSemiBoldStyle(fontSize: 16.0).copyWith(
                  color: _selectedIndex == index
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
