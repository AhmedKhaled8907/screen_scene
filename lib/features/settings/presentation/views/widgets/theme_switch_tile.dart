import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/global/resources/colors_manager.dart';
import '../../../../../core/global/resources/strings_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import '../../../../../core/global/theme/theme_bloc/theme_bloc.dart';

class ThemeSwitchTile extends StatelessWidget {
  const ThemeSwitchTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      buildWhen: (previous, current) =>
          previous.isDarkMode != current.isDarkMode,
      builder: (context, state) {
        final isDarkMode = state.isDarkMode;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColors.greyWithShade,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: SwitchListTile(
            activeColor: AppColors.gold,
            contentPadding: EdgeInsets.zero,
            title: Text(
              isDarkMode ? AppString.darkMode : AppString.lightMode,
              style: getRegularStyle(
                color: AppColors.white,
              ),
            ),
            value: isDarkMode,
            onChanged: (value) {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
          ),
        );
      },
    );
  }
}
