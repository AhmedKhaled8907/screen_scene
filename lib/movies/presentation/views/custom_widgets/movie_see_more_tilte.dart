
import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular_see_more/dummy.dart';

class MovieSeeMoreTitle extends StatelessWidget {
  const MovieSeeMoreTitle({
    super.key,
    required this.dummy,
  });

  final DummyModel dummy;

  @override
  Widget build(BuildContext context) {
    return Text(
      dummy.title,
      maxLines: 1,
      style: getBoldStyle(
        letterSpacing: AppSize.s1_25,
        fontSize: AppSize.s18,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
