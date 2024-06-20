import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/poster_image.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_derails_view.dart';

import 'package:movies_app/movies/presentation/views/movie_view/top_rated/top_rated_components.dart';

class PopularComponents extends StatelessWidget {
  const PopularComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (context, state) {
        switch (state.popularState) {
          case RequestState.loading:
            return const CustomLoadingIndicator(height: 170);

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.popularMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.popularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        /// TODO : NAVIGATE TO MOVIE DETAILS
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetailView(id: movie.id),
                          ));
                        },
                        child: PosterImage(posterPath: movie.posterPath),
                      ),
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
