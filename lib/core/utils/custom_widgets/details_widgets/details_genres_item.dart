import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/entities/genres_entity.dart';

class DetailsGenresItem extends StatelessWidget {
  const DetailsGenresItem({
    super.key,
    required this.genres,
  });

  final GenresEntity genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
        vertical: AppPadding.p4,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Center(
        child: Text(
          genres.name,
          style: getMediumStyle(
            fontSize: FontSize.s14,
            letterSpacing: AppSize.s1_25,
          ),
        ),
      ),
    );
  }
}
