import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/features/auth/domain/entities/user_entity.dart';

class NameImage extends StatelessWidget {
  final UserEntity user;
  final double height;
  final double fontSize;

  const NameImage({
    super.key,
    required this.user,
    this.height = 45,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        color: AppColors.greyWithShade,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          user.name.substring(0, 2).toUpperCase(),
          style: getSemiBoldStyle(
            fontSize: fontSize,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
