import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/global/resources/strings_manager.dart';
import 'core/global/theme/theme_bloc/theme_bloc.dart';
import 'core/utils/app_bloc_observer.dart';
import 'core/utils/services/services_locator.dart';
import 'core/utils/services/shared_preferences_singleton.dart';
import 'features/home/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'features/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'features/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'ScreenScene',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  await Prefs.init();

  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc()..add(LoadThemeEvent()),
        ),
        BlocProvider(create: (_) => sl<BottomNavBarCubit>()),
        BlocProvider(
          create: (_) => sl<MovieBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider(
          create: (_) => sl<TvBloc>()
            ..add(GetOnTheAirTvsEvent())
            ..add(GetPopularTvsEvent())
            ..add(GetTopRatedTvsEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppString.appName.toUpperCase(),
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
