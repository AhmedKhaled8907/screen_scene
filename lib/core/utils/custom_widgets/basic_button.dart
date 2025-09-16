import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';

import '../../global/resources/colors_manager.dart';
import '../../global/resources/values_manager.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? color;

  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.color = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? AppSize.s56),
        backgroundColor: AppColors.gold,
      ),
      child: Text(
        title,
        style: getBoldStyle(
          color:color,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}
