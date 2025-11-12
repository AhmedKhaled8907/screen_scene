import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/services/services_locator.dart';
import '../../controller/movie_details_bloc/movie_details_bloc.dart';
import '../../controller/similar_movies_bloc/similar_movies_bloc.dart';
import 'movie_detail_view_body.dart';

class MovieDetailView extends StatelessWidget {
  final int id;

  const MovieDetailView({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<MovieDetailsBloc>()
            ..add(
              GetMovieDetailsEvent(movieId: id),
            ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<SimilarMoviesBloc>()
            ..add(
              GetSimilarMoviesEvent(movieId: id),
            ),
          lazy: false,
        ),
      ],
      child: const Scaffold(
        body: MovieDetailsViewBody(),
      ),
    );
  }
}
