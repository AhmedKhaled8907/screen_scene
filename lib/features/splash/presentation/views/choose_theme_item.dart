import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/global/resources/styles_manager.dart';

import '../../../../core/global/resources/colors_manager.dart';
import '../../../../core/global/resources/font_manager.dart';
import '../../../../core/global/resources/values_manager.dart';

class ChooseModeItem extends StatelessWidget {
  const ChooseModeItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: AppSize.s20,
                sigmaY: AppSize.s20,
              ),
              child: Container(
                width: AppSize.s80,
                height: AppSize.s80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.filteredBg,
                ),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s16),
          Text(
            title,
            style: getMediumStyle(
              color: AppColors.white,
              fontSize: FontSize.s18,
            ),
          ),
        ],
      ),
    );
  }
}
