import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/theme/app_colors/app_color_dark.dart';

import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

ThemeData getThemeDataDark() {
  return ThemeData.dark().copyWith(
    primaryColor: AppColors.gold,
    primaryColorDark: AppColors.gold,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorDark.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorDark.appBarBackgroundColor,
      surfaceTintColor: AppColorDark.appBarBackgroundColor,
      elevation: AppSize.s0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorDark.appBarBackgroundColor,
      elevation: AppSize.s0,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.white.withOpacity(AppSize.s0_5),
      selectedLabelStyle: getMediumStyle(
        fontSize: FontSize.s14,
      ),
      unselectedLabelStyle: getMediumStyle(
        fontSize: FontSize.s14,
      ),
    ),
    hintColor: AppColors.white,
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.gold),
  );
}
