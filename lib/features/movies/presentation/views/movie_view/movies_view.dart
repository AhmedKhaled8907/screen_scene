import 'package:flutter/material.dart';

import 'movie_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieViewBody(),
    );
  }
}
