import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global/resources/colors_manager.dart';
import '../../../global/resources/font_manager.dart';
import '../../../global/resources/styles_manager.dart';
import '../../../global/resources/values_manager.dart';
import '../../../global/theme/theme_bloc/theme_bloc.dart';
import '../../entities/genres_entity.dart';

class DetailsGenresItem extends StatelessWidget {
  const DetailsGenresItem({
    super.key,
    required this.genres,
  });

  final GenresEntity genres;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool isDarkMode = state.isDarkMode;
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p8,
            vertical: AppPadding.p4,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDarkMode ? AppColors.white : AppColors.black,
              width: AppSize.s1,
            ),
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
      },
    );
  }
}
