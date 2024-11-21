import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';

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
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.gold,
        ),
      ),
    );
  }
}
