import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

TextStyle _getTextStyle(
  FontWeight fontWeight,
  double fontSize,
  double? letterSpacing,
) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    fontSize: fontSize,
    letterSpacing: letterSpacing,
  );
}

// light textStyle
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  double? letterSpacing = AppSize.s1,
}) {
  return _getTextStyle(
    FontWeightManager.light,
    fontSize,
    letterSpacing,
  );
}

// regular textStyle
TextStyle getRegularStyle({
  double fontSize = FontSize.s16,
  double? letterSpacing = AppSize.s1,
}) {
  return _getTextStyle(
    FontWeightManager.regular,
    fontSize,
    letterSpacing,
  );
}

// Medium textStyle
TextStyle getMediumStyle({
  double fontSize = FontSize.s20,
  double? letterSpacing = AppSize.s1,
}) {
  return _getTextStyle(
    FontWeightManager.medium,
    fontSize,
    letterSpacing,
  );
}

// Semi-Bold textStyle
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  double? letterSpacing = AppSize.s1,
}) {
  return _getTextStyle(
    FontWeightManager.semiBold,
    fontSize,
    letterSpacing,
  );
}

// Bold textStyle
TextStyle getBoldStyle({
  double fontSize = FontSize.s22,
  double? letterSpacing = AppSize.s1,
}) {
  return _getTextStyle(
    FontWeightManager.bold,
    fontSize,
    letterSpacing,
  );
}
