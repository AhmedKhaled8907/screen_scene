import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_loading_indicator.dart';
import 'package:screen_scene/core/utils/custom_widgets/poster_image.dart';
import 'package:screen_scene/core/utils/enums.dart';
import 'package:screen_scene/features/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:screen_scene/features/tvs/presentation/views/tv_details_view/tv_details_view.dart';

class TopRatedTvsComponents extends StatelessWidget {
  const TopRatedTvsComponents({super.key});

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
                  itemCount: state.topRatedTvs.length,
                  itemBuilder: (context, index) {
                    final tv = state.topRatedTvs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TvDetailView(
                            id: tv.id,
                          ),
                        ));
                      },
                      child: PosterImage(
                        posterPath: tv.posterPath,
                      ),
                    );
                  },
                ),
              ),
            );

          case RequestState.error:
            return const SizedBox();
        }
      },
    );
  }
}
