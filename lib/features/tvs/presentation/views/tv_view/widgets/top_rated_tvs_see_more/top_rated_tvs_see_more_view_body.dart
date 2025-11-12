import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/global/resources/values_manager.dart';
import '../../../../../../../core/utils/custom_widgets/custom_loading_indicator.dart';
import '../../../../../../../core/utils/enums.dart';
import '../../../../controller/tv_bloc/tv_bloc.dart';
import 'top_rated_tvs_see_more_view_list_view.dart';

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
