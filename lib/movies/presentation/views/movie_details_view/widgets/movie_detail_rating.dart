import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
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
          size: AppSize.s20,
        ),
        const SizedBox(width: AppSize.s4),
        Text(
          (movie!.voteAverage / AppSize.s2).toStringAsFixed(1),
          style: getMediumStyle(
            fontSize: FontSize.s16,
            letterSpacing: AppSize.s1_25,
          ),
        ),
      ],
    );
  }
}
