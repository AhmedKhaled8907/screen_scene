import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:movies_app/core/utils/custom_widgets/custom_loading_indicator.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/top_rated_see_more/top_rated_see_more_view_list_view.dart';

class TopRatedSeeMoreViewBody extends StatelessWidget {
  const TopRatedSeeMoreViewBody({super.key});

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
            return TopRatedSeeMoreListView(list: state.topRatedMovies);
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
