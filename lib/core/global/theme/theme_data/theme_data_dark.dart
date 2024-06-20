import 'package:flutter/material.dart';
import 'package:movies_app/core/global/theme/app_colors/app_color_dark.dart';

ThemeData getThemeDataDark() {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColorDark.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorDark.appBarBackgroundColor,
    ),
  );
}
