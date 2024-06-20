import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

class MovieOverView extends StatelessWidget {
  const MovieOverView({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: getRegularStyle(
        letterSpacing: AppSize.s1_25,
        fontSize: FontSize.s14,
      ),
    );
  }
}
