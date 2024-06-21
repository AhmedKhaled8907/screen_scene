import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

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
            child: Text(
              AppString.slidingText,
              style: getRegularStyle(fontSize: FontSize.s14).copyWith(
                color: AppColors.white.withOpacity(AppSize.s0_5),
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
