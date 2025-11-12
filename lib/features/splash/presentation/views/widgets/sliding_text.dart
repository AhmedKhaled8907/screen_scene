import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/global/resources/font_manager.dart';
import '../../../../../core/global/resources/strings_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
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
                  style: getRegularStyle(fontSize: FontSize.s16).copyWith(
                    color: isDarkMode
                        ? const Color(0xff949D9E)
                        : const Color(0xff949D9E),
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          );
        });
  }
}
