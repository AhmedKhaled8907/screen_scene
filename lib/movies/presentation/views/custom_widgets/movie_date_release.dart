import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

class MovieDateRelease extends StatelessWidget {
  const MovieDateRelease({
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
        color: Colors.grey[AppColorShades.colorShade800],
        borderRadius: BorderRadius.circular(AppRadius.r4),
      ),
      child: Text(
        releaseDate.split('-')[AppSize.s0.toInt()],
        style: getMediumStyle(
          fontSize: AppSize.s16,
        ),
      ),
    );
  }
}
