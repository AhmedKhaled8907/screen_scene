import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsOverView extends StatelessWidget {
  const MovieDetailsOverView({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      movie!.overview,
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.2,
      ),
    );
  }
}
