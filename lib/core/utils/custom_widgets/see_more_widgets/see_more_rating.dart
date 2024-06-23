import 'package:flutter/material.dart';

import '../../../global/resources/colors_manager.dart';
import '../../../global/resources/font_manager.dart';
import '../../../global/resources/styles_manager.dart';
import '../../../global/resources/values_manager.dart';

class SeeMoreRating extends StatelessWidget {
  const SeeMoreRating({
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
          ).copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
