import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsTitle extends StatelessWidget {
  const MovieDetailsTitle({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      movie!.title,
      style: getBoldStyle(),
    );
  }
}
