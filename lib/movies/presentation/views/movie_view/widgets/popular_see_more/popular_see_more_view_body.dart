import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:movies_app/core/utils/custom_widgets/custom_loading_indicator.dart';

import 'popular_see_more_view_list_view.dart';

class PopularSeeMoreViewBody extends StatelessWidget {
  const PopularSeeMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return const CustomLoadingIndicator(
              height: AppSize.s170,
            );

          case RequestState.loaded:
            return PopularSeeMoreListView(list: state.popularMovies);
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}

