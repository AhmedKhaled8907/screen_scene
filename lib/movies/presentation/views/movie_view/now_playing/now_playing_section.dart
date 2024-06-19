import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/views/movie_view/now_playing/now_playing_text_with_shader.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_detail_view.dart';

import '../../../controller/movie_bloc/movie_bloc.dart';

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
            return SizedBox(
              height: size.height * 0.5,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: size.height * 0.5,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        /// TODO : NAVIGATE TO MOVIE DETAILS
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailView(id: item.id),
                        ));
                      },
                      child: NowPlayingTextWithShade(
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
