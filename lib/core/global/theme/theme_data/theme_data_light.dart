import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

ThemeData getThemeDataLight() {
  return ThemeData(
    fontFamily: 'Cairo',
    primaryColor: AppColors.gold,
    primaryColorLight: AppColors.gold,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      elevation: AppSize.s0,
      backgroundColor: AppColors.lightBackground,
      surfaceTintColor: AppColors.lightBackground,
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      elevation: AppSize.s0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(
        fill: 1.0,
      ),
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.black.withOpacity(AppSize.s0_3),
      selectedLabelStyle: getMediumStyle(
        fontSize: FontSize.s14,
      ),
      unselectedLabelStyle: getMediumStyle(
        fontSize: FontSize.s14,
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.gold),
    tabBarTheme: TabBarThemeData(indicatorColor: AppColors.gold),
  );
}
