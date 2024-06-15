import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc()..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          log(state.toString());
          return const Scaffold();
        },
      ),
    );
  }
}
