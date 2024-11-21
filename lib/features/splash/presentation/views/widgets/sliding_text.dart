import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import '../../../../../core/global/theme/theme_bloc/theme_bloc.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, Widget? child) {
          return SlideTransition(
            position: slidingAnimation,
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                bool isDarkMode = state.isDarkMode;

                return Text(
                  AppString.slidingText,
                  style: getRegularStyle(fontSize: FontSize.s14).copyWith(
                    color: isDarkMode ? AppColors.gold : AppColors.gold,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          );
        });
  }
}
