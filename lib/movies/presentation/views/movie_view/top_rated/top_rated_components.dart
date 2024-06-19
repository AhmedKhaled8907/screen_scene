import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/poster_image.dart';

import '../../../controller/movie_bloc/movie_bloc.dart';
import '../../movie_details_view/movie_detail_view.dart';

class TopRatedComponents extends StatelessWidget {
  const TopRatedComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovies[index];
                    return InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO MOVIE DETAILS
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailView(id: movie.id),
                        ));
                      },
                      child: PosterImage(posterPath: movie.posterPath),
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
