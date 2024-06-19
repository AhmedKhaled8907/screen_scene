import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsDateRelease extends StatelessWidget {
  const MovieDetailsDateRelease({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        movie!.releaseDate.split('-')[0],
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
