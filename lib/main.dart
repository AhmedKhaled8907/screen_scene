import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Splash/presentation/views/splash_view.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/utils/services/services_locator.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:movies_app/tvs/presentation/controller/tv_bloc/tv_bloc.dart';

import 'core/global/theme/theme_bloc/theme_bloc.dart';
import 'core/utils/app_bloc_observer.dart';

void main() {
  ServicesLocator().init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc()..add(LoadThemeEvent()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, theme) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<MovieBloc>()
                  ..add(GetNowPlayingMoviesEvent())
                  ..add(GetPopularMoviesEvent())
                  ..add(GetTopRatedMoviesEvent()),
              ),
              BlocProvider(
                create: (context) => sl<TvBloc>()
                  ..add(GetOnTheAirTvsEvent())
                  ..add(GetPopularTvsEvent())
                  ..add(GetTopRatedTvsEvent()),
              ),
            ],
            child: MaterialApp(
              title: AppString.appName,
              debugShowCheckedModeBanner: false,
              theme: theme.themeData,
              home: const SplashView(),
            ),
          );
        },
      ),
    );
  }
}
