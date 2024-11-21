import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';

class DetailsDateRelease extends StatelessWidget {
  const DetailsDateRelease({
    super.key,
    required this.releaseDate,
  });

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p2,
        horizontal: AppSize.s8,
      ),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(AppRadius.r4),
      ),
      child: Text(
        releaseDate.split('-')[AppSize.s0.toInt()],
        style: getMediumStyle(
          fontSize: AppSize.s16,
        ).copyWith(color: AppColors.white),
      ),
    );
  }
}
