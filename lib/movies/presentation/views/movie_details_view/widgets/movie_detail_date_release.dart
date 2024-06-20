import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
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
        vertical: AppPadding.p2,
        horizontal: AppSize.s8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[AppColorShades.colorShade800],
        borderRadius: BorderRadius.circular(AppRadius.r4),
      ),
      child: Text(
        movie!.releaseDate.split('-')[AppSize.s0.toInt()],
        style: getMediumStyle(
          fontSize: AppSize.s16,
        ),
      ),
    );
  }
}
