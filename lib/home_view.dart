import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/home_view_body.dart';

import 'core/global/theme/theme_bloc/theme_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ThemeBloc>().add(ToggleThemeEvent());
                },
                child: const Text('Toggle Theme'),
              ),
            ),
          ],
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
