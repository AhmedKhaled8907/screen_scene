import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_details_view.dart';

import '../../../../core/global/resources/font_manager.dart';
import '../../../../core/global/resources/strings_manager.dart';
import '../../../../core/global/resources/styles_manager.dart';
import '../../../../core/global/resources/values_manager.dart';
import '../../../../core/utils/custom_widgets/custom_loading_indicator.dart';
import '../../controller/bloc/search_bloc.dart';
import 'search_results_item.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return Center(
            child: Text(
              AppString.anythingYouWant,
              style: getMediumStyle(fontSize: FontSize.s16),
            ),
          );
        } else if (state is SearchLoading) {
          return const CustomLoadingIndicator(
            height: AppSize.s100,
          );
        } else if (state is SearchSuccess) {
          if (state.results.isEmpty) {
            Center(
              child: Text(
                AppString.noResultsFound,
                style: getMediumStyle(fontSize: FontSize.s16),
              ),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              final searchEntity = state.results[index];
              return InkWell(
                onTap: () {
                  /// NAVIGATE TO MOVIE DETAILS
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieDetailView(
                        id: searchEntity.id,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    SearchResultsItem(item: searchEntity),
                  ],
                ),
              );
            },
          );
        } else if (state is SearchError) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
