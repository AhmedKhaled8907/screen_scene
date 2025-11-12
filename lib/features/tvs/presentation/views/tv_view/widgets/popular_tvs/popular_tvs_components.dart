import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/global/resources/values_manager.dart';
import '../../../../../../../core/utils/custom_widgets/custom_loading_indicator.dart';
import '../../../../../../../core/utils/custom_widgets/poster_image.dart';
import '../../../../../../../core/utils/enums.dart';
import '../../../../controller/tv_bloc/tv_bloc.dart';
import '../../../tv_details_view/tv_details_view.dart';

class PopularTvsComponents extends StatelessWidget {
  const PopularTvsComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return const CustomLoadingIndicator(
              height: AppSize.s170,
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: AppDuration.d500),
              child: SizedBox(
                height: AppSize.s170,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16,
                  ),
                  itemCount: state.popularTvs.length,
                  itemBuilder: (context, index) {
                    final tv = state.popularTvs[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(AppRadius.r8),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TvDetailView(
                            id: tv.id,
                          ),
                        ));
                      },
                      child: PosterImage(posterPath: tv.posterPath),
                    );
                  },
                ),
              ),
            );

          case RequestState.error:
            return Container();
        }
      },
    );
  }
}
