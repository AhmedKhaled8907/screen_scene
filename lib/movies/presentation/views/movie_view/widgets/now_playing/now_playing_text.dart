import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

class NowPlayingText extends StatelessWidget {
  const NowPlayingText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: AppColors.redAccent,
                  size: AppSize.s16,
                ),
                const SizedBox(width: AppSize.s4),
                Text(
                  AppString.nowPlaying.toUpperCase(),
                  style: getRegularStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppPadding.p16,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                letterSpacing: AppSize.s1_25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
