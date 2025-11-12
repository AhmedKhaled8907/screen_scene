import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/back_end_points.dart';
import '../../../../core/global/resources/colors_manager.dart';
import '../../../../core/global/resources/font_manager.dart';
import '../../../../core/global/resources/strings_manager.dart';
import '../../../../core/global/resources/styles_manager.dart';
import '../../../../core/global/resources/values_manager.dart';
import '../../../../core/global/theme/theme_bloc/theme_bloc.dart';
import '../../../../core/utils/custom_widgets/basic_button.dart';
import '../../../../core/utils/services/shared_preferences_singleton.dart';
import '../../../auth/presentation/views/signin_view.dart';
import 'choose_theme_item.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInRight(
        duration: const Duration(milliseconds: AppDuration.d500),
        child: Stack(
          children: [
            // background image
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      context.isDarkMode
                          ? 'assets/images/dark_joker.jpg'
                          : 'assets/images/light_joker.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            // black overlay
            context.isDarkMode
                ? Container(color: AppColors.black.withOpacity(AppSize.s0_5))
                : Container(color: AppColors.black.withOpacity(AppSize.s0_03)),

            // content section
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s36,
                ).copyWith(
                  bottom: AppPadding.p64,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // logo image

                    const Spacer(),

                    // choose mode
                    Text(
                      AppString.chooseMode,
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                        color: Colors.white,
                        fontSize: FontSize.s24,
                      ),
                    ),
                    const SizedBox(height: AppSize.s48),

                    // get started text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ChooseModeItem(
                          image: 'assets/images/sun.svg',
                          title: AppString.lightMode,
                          onTap: () {
                            context.read<ThemeBloc>().add(
                                  const LightThemeEvent(
                                    ThemeMode.light,
                                  ),
                                );
                          },
                        ),
                        ChooseModeItem(
                          image: 'assets/images/moon.svg',
                          title: AppString.darkMode,
                          onTap: () {
                            context.read<ThemeBloc>().add(
                                  const DarkThemeEvent(
                                    ThemeMode.dark,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSize.s48),

                    // get started button
                    BasicAppButton(
                      color: AppColors.black,
                      title: AppString.continueText,
                      onPressed: () {
                        Prefs.setBool(BackEndPoints.kISChooseTheme, true);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SigninView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
