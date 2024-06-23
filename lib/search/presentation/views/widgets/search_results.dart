import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_details_view.dart';
import 'package:movies_app/tvs/presentation/views/tv_details_view/tv_details_view.dart';

import '../../../../core/global/resources/font_manager.dart';
import '../../../../core/global/resources/strings_manager.dart';
import '../../../../core/global/resources/styles_manager.dart';
import '../../../../core/global/resources/values_manager.dart';
import '../../../../core/utils/custom_widgets/custom_loading_indicator.dart';
import '../../../../movies/domain/entities/movie_entity.dart';
import '../../../../tvs/domain/entities/tv_entity.dart';
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
        } else if (state is SearchMoviesSuccess) {
          return _buildMoviesList(state.results);
        } else if (state is SearchMoviesError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is SearchTvsSuccess) {
          return _buildTvsList(state.results);
        } else if (state is SearchTvsError) {
          return Center(
            child: Text(state.message),
          );
        }
        //  else if (state is SearchPersonsSuccess) {
        //   return _buildPersonsList(state.results);
        // } else if (state is SearchPersonsError) {
        //   return Center(
        //     child: Text(state.message),
        //   );
        // }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildMoviesList(List<MovieEntity> results) {
    if (results.isEmpty) {
      return Center(
        child: Text(
          AppString.noResultsFound,
          style: getMediumStyle(fontSize: FontSize.s16),
        ),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final searchEntity = results[index];
        return InkWell(
          onTap: () {
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
              SearchResultsItem(
                title: searchEntity.title,
                posterPath: searchEntity.posterPath,
                releaseDate: searchEntity.releaseDate,
                voteAverage: searchEntity.voteAverage.toDouble(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTvsList(List<TvEntity> results) {
    if (results.isEmpty) {
      return Center(
        child: Text(
          AppString.noResultsFound,
          style: getMediumStyle(fontSize: FontSize.s16),
        ),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final searchEntity = results[index];
        return InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TvDetailView(
                  id: searchEntity.id,
                ),
              ),
            );
          },
          child: Column(
            children: [
              SearchResultsItem(
                title: searchEntity.title,
                posterPath: searchEntity.posterPath,
                releaseDate: searchEntity.firstAirTime,
                voteAverage: searchEntity.voteAverage.toDouble(),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildPersonsList(List<PersonEntity> results) {
  //   if (results.isEmpty) {
  //     return Center(
  //       child: Text(
  //         AppString.noResultsFound,
  //         style: getMediumStyle(fontSize: FontSize.s16),
  //       ),
  //     );
  //   }
  //   return ListView.builder(
  //     physics: const BouncingScrollPhysics(),
  //     itemCount: results.length,
  //     itemBuilder: (context, index) {
  //       final searchEntity = results[index];
  //       return InkWell(
  //         onTap: () {
  //           FocusScope.of(context).unfocus();
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) => PersonDetailView(
  //                 id: searchEntity.id,
  //               ),
  //             ),
  //           );
  //         },
  //         child: Column(
  //           children: [
  //             SearchResultsItem(item: searchEntity),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
