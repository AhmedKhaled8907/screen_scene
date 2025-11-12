import 'package:flutter/material.dart';

import '../../../../../core/global/resources/colors_manager.dart';
import '../../../../../core/global/resources/font_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import '../../../../../core/global/resources/values_manager.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const SettingsCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.greyWithShade,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          title: Text(
            title,
            style: getRegularStyle(
              fontSize: FontSize.s16,
              color: AppColors.white,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: AppSize.s36,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
