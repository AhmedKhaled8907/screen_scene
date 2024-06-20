import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/popular_see_more/dummy.dart';

class SeeMoreOverViewText extends StatelessWidget {
  const SeeMoreOverViewText({
    super.key,
    required this.dummy,
  });

  final DummyModel dummy;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        dummy.overView,
        maxLines: 2,
        style: const TextStyle(
          fontSize: 16,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
