import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsDuration extends StatelessWidget {
  const MovieDetailsDuration({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      _showDuration(movie!.runtime),
      style: const TextStyle(
        // color: Colors.white70,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.2,
      ),
    );
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ AppDuration.d60;
    final int minutes = runtime % AppDuration.d60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
