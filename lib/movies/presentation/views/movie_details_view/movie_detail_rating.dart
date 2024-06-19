import 'package:flutter/material.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsRating extends StatelessWidget {
  const MovieDetailsRating({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          (movie!.voteAverage / 2).toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
