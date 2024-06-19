import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';

import 'home_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: const Scaffold(
        // appBar: AppBar(),
        // drawer: Drawer(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Center(
        //         child: ElevatedButton(
        //           onPressed: () {
        //             context.read<ThemeBloc>().add(ToggleThemeEvent());
        //           },
        //           child: const Text('Toggle Theme'),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: HomeViewBody(),
      ),
    );
  }
}




