import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/custom_loading_indicator.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movies_app/features/tvs/presentation/views/tv_view/widgets/top_rated_tvs_see_more/top_rated_tvs_see_more_view_list_view.dart';


class TopRatedTvsSeeMoreViewBody extends StatelessWidget {
  const TopRatedTvsSeeMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const CustomLoadingIndicator(
              height: AppSize.s170,
            );

          case RequestState.loaded:
            return TopRatedTvsSeeMoreListView(list: state.topRatedTvs);
          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
