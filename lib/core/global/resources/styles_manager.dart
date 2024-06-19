import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';

TextStyle _getTextStyle(FontWeight fontWeight, double fontSize, Color color) {
  return TextStyle(
    // fontFamily: FontConstants.fon,
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
  );
}

// light textStyle
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontWeightManager.light,
    fontSize,
    color,
  );
}

// regular textStyle
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontWeightManager.regular,
    fontSize,
    color,
  );
}

// Medium textStyle
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontWeightManager.medium,
    fontSize,
    color,
  );
}

// Semi-Bold textStyle
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontWeightManager.semiBold,
    fontSize,
    color,
  );
}

// Bold textStyle
TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    FontWeightManager.bold,
    fontSize,
    color,
  );
}
