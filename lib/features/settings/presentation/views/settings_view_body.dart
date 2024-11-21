import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/build_error_bar.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_button.dart';
import 'package:screen_scene/core/utils/custom_widgets/custom_loading_hud.dart';
import 'package:screen_scene/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:screen_scene/features/auth/presentation/views/signin_view.dart';

import '../../../../core/global/resources/colors_manager.dart';
import '../../../../core/global/theme/theme_bloc/theme_bloc.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p20,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<ThemeBloc, ThemeState>(
              buildWhen: (previous, current) =>
                  previous.isDarkMode != current.isDarkMode,
              builder: (context, state) {
                final isDarkMode = state.isDarkMode;

                return SwitchListTile(
                  activeColor: isDarkMode ? AppColors.gold : AppColors.gold,
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
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocConsumer<SigninCubit, SigninState>(
                    listener: (context, state) {
                      if (state is SignoutSuccess) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SigninView(),
                          ),
                        );
                        buildErrorBar(context, 'Sign out successfully');
                      }
                      if (state is SigninFailure) {
                        buildErrorBar(context, state.message);
                      }
                    },
                    builder: (context, state) => CustomLoadingHud(
                      isLoading: state is SigninLoading ? true : false,
                      child: CustomButton(
                        onPressed: () {
                          context.read<SigninCubit>().signOut();
                        },
                        title: 'Sign out',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
