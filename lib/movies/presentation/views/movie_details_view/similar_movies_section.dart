import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/presentation/controller/similar_movies_bloc/similar_movies_bloc.dart';
import 'package:movies_app/movies/presentation/views/custom_widgets/poster_image.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view/movie_detail_View.dart';

class SimilarMoviesSection extends StatelessWidget {
  const SimilarMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
      builder: (context, state) {
        switch (state.similarMoviesState) {
          case RequestState.loading:
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 170,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );

          case RequestState.loaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: state.similarMovies.length,
                (context, index) {
                  final similarMoviesItem = state.similarMovies[index];
                  return InkWell(
                    onTap: () {
                      /// TODO : NAVIGATE TO MOVIE DETAILS
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailView(id: similarMoviesItem.movieId),
                      ));
                    },
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: PosterImage(
                        posterPath: similarMoviesItem.posterPath!,
                      ),
                    ),
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            );

          case RequestState.error:
            return Center(
              child: Text(state.similarMoviesMessage),
            );
        }
      },
    );
  }
}
