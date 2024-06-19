
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/presentation/views/movie_view/now_playing/now_playing_text.dart';

import 'now_playing_image.dart';

class NowPlayingTextWithShade extends StatelessWidget {
  const NowPlayingTextWithShade({
    super.key,
    required this.title,
    required this.posterPath,
  });

  final String title;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // fromLTRB
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0, 0.3, 0.5, 1],
            ).createShader(
              Rect.fromLTRB(0, 0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: NowPlayingImage(
            posterPath: AppConstants.imageUrl(posterPath),
          ),
        ),
        NowPlayingText(
          title: title,
        ),
      ],
    );
  }
}
