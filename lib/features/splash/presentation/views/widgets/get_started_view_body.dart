import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:screen_scene/core/back_end_points.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/custom_widgets/basic_button.dart';
import 'package:screen_scene/core/utils/services/shared_preferences_singleton.dart';
import 'package:screen_scene/features/splash/presentation/views/choose_theme.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: AppDuration.d500),
      child: Stack(
        children: [
          // background image
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/god_father.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(color: Colors.black54),
            ),
          ),

          // content section
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s24,
              ).copyWith(
                bottom: AppPadding.p64,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // logo image

                  const SizedBox(height: AppSize.s24),

                  const Spacer(),

                  // enjoy text
                  Text(
                    AppString.findText,
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                      color: AppColors.white,
                      fontSize: FontSize.s24,
                    ),
                  ),
                  const SizedBox(height: AppSize.s24),

                  // get started text
                  Text(
                    AppString.getStartedText,
                    textAlign: TextAlign.center,
                    maxLines: AppSize.s5.toInt(),
                    style: getLightStyle(
                      color: AppColors.white,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  const SizedBox(height: AppSize.s36),

                  // get started button
                  BasicAppButton(
                    title: AppString.getStarted,
                    onPressed: () {
                      Prefs.setBool(BackEndPoints.kIsGetStarted, true);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const ChooseModePage(),
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
    );
  }
}
