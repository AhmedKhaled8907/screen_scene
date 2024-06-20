import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/movies/presentation/views/movie_view/widgets/now_playing/now_playing_text.dart';

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
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // fromLTRB
                AppColors.transparent,
                AppColors.black,
                AppColors.black,
                AppColors.transparent,
              ],
              stops: const [AppSize.s0, AppSize.s0_3, AppSize.s0_5, AppSize.s1],
            ).createShader(
              Rect.fromLTRB(AppSize.s0, AppSize.s0, rect.width, rect.height),
            );
          },
          blendMode: BlendMode.dstIn,
          child: NowPlayingImage(
            posterPath: ApiConstants.imageUrl(posterPath),
          ),
        ),
        NowPlayingText(title: title),
      ],
    );
  }
}
