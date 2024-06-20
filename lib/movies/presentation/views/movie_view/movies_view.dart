import 'package:flutter/material.dart';

import 'home_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    );
  }
}
