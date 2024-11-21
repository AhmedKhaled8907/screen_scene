import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.voteAverage,
  });

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: AppSize.s20,
        ),
        const SizedBox(width: AppSize.s4),
        Text(
          (voteAverage).toStringAsFixed(1),
          style: getMediumStyle(
            fontSize: FontSize.s16,
            letterSpacing: AppSize.s1_25,
          ),
        ),
      ],
    );
  }
}
