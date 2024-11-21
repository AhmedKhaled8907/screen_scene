import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/theme/theme_bloc/theme_bloc.dart';

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
          color:
              context.isDarkMode ? AppColors.gold : AppColors.secondBackground,
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
              color: AppColors.black,
            ),
          ),
          trailing: const Icon(
            Icons.chevron_right,
            size: 36,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
