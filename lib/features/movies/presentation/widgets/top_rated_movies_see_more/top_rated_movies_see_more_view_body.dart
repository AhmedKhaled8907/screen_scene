import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/global/resources/values_manager.dart';
import '../../../../../core/utils/custom_widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/enums.dart';
import '../../controller/movie_bloc/movie_bloc.dart';
import 'top_rated_movies_see_more_view_list_view.dart';

class TopRatedMoviesSeeMoreViewBody extends StatelessWidget {
  const TopRatedMoviesSeeMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const CustomLoadingIndicator(
              height: AppSize.s170,
            );

          case RequestState.loaded:
            return TopRatedMoviesSeeMoreListView(list: state.topRatedMovies);
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
