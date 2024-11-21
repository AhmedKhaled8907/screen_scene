import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';

class SeeMoreTitle extends StatelessWidget {
  const SeeMoreTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: getBoldStyle(
        letterSpacing: AppSize.s1_25,
        fontSize: AppSize.s18,
      ).copyWith(color: AppColors.white),
    );
  }
}
