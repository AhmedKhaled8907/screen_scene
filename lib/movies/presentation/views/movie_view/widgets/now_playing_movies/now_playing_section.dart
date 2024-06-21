import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/core/utils/custom_widgets/custom_loading_indicator.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_details_view.dart';
import 'package:movies_app/core/utils/custom_widgets/title_with_shader.dart';

import '../../../../controller/movie_bloc/movie_bloc.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.loading:
            return CustomLoadingIndicator(
              height: size.height * AppSize.s0_5,
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: AppDuration.d500),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: size.height * AppSize.s0_5,
                  viewportFraction: AppConstants.viewportFraction,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key(AppString.openMovieMinimalDetailKey),
                      onTap: () {
                        /// TODO : NAVIGATE TO MOVIE DETAILS
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailView(
                            id: item.id,
                          ),
                        ));
                      },
                      child: TitleWithShade(
                        posterPath: item.posterPath,
                        title: item.title,
                      ),
                    );
                  },
                ).toList(),
              ),
            );

          case RequestState.error:
            return Center(
              child: Text(state.nowPlayingMessage),
            );
        }
      },
    );
  }
}
