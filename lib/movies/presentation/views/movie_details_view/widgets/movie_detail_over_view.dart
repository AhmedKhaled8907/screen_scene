import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
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
      style: getRegularStyle(
        letterSpacing: AppSize.s1_25,
        fontSize: FontSize.s14,
      ),
    );
  }
}
