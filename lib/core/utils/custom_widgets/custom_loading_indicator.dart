import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/theme/theme_bloc/theme_bloc.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: context.isDarkMode ? AppColors.gold : AppColors.darkGold,
        ),
      ),
    );
  }
}
