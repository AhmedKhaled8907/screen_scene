import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

import '../../../core/global/resources/colors_manager.dart';
import '../../../core/global/theme/theme_bloc/theme_bloc.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<ThemeBloc, ThemeState>(
            buildWhen: (previous, current) =>
                previous.isDarkMode != current.isDarkMode,
            builder: (context, state) {
              final isDarkMode = state.isDarkMode;
              return SwitchListTile(
                activeColor: isDarkMode ? AppColors.gold : AppColors.darkGold,
                contentPadding: EdgeInsets.zero,
                secondary: Image.asset(
                  AppString.themeImage,
                  height: AppSize.s50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  isDarkMode ? AppString.darkMode : AppString.lightMode,
                  style: getMediumStyle(),
                ),
                value: isDarkMode,
                onChanged: (value) {
                  context.read<ThemeBloc>().add(ToggleThemeEvent());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
