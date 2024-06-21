import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/now_playing_and_on_air_text.dart';

import 'slider_image.dart';

class TitleWithShade extends StatelessWidget {
  const TitleWithShade({
    super.key,
    required this.title,
    required this.posterPath,
    required this.nowOrAirText,
  });

  final String title;
  final String posterPath;
  final String nowOrAirText;

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
          child: SliderImage(
            posterPath: ApiConstants.imageUrl(posterPath),
          ),
        ),
        NowPlayingAndOnAirText(
          title: title,
          itemText: nowOrAirText,
        ),
      ],
    );
  }
}
