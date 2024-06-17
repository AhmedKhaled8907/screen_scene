import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

import 'core/global/theme/theme_bloc/theme_bloc.dart';

void main() {
  ServicesLocator().init();
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
          return MaterialApp(
            theme: theme.themeData,
            home: const MoviesScreen(),
          );
        },
      ),
    );
  }
}
