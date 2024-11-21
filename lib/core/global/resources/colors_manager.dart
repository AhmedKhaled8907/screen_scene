import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color redAccent = Colors.redAccent;
  static const Color red = Colors.red;
  static const Color grey = Colors.grey;
  static const Color blueAccent = Colors.blueAccent;
  static const Color gold = Color(0xFFFFD700);
  static const Color darkGold = Color(0xFF875a28);
  static const Color lightGold = Color(0xFFE6963A);
  static const Color textFieldColor = Color.fromARGB(255, 106, 106, 106);
  static Color filteredBg = const Color(0x0fffffff).withOpacity(AppSize.s0_03);

  // Background colors
  static Color? lightBackground = Colors.grey[AppColorShades.colorShade200];
  // static Color grey = const Color(0xff737477);
  // static Color lightGrey = const Color(0xff9E9E9E);

  // // new colors
  // static Color darkPrimary = const Color(0xffd17d11);
  // static Color lightPrimary = const Color(0xCCd17d11); // color with 80% opacity
  // static Color grey1 = const Color(0xff707070);
  // static Color grey2 = const Color(0xff797979);
  // static Color white = const Color(0xffFFFFFF);
  // static Color error = const Color(0xffe61f34); // red color
}

class AppColorShades {
  static const int colorShade200 = 200;
  static const int colorShade700 = 700;
  static const int colorShade800 = 800;
  static const int colorShade850 = 850;
  static const int colorShade900 = 900;
}
