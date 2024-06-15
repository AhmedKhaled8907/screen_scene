import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(
        GetNowPlayingMoviesUseCase(sl()),
      )..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          log(state.toString());
          return const Scaffold();
        },
      ),
    );
  }
}
