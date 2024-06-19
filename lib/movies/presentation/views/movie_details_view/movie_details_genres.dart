import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_strings.dart';
import 'package:movies_app/movies/domain/entities/genres_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsGenres extends StatelessWidget {
  const MovieDetailsGenres({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppString.genres}: ${_showGenres(movie!.genres!)}',
      style: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
    );
  }

  String _showGenres(List<GenresEntity> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
