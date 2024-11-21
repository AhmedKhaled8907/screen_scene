import 'package:flutter/material.dart';
import 'package:screen_scene/core/back_end_points.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/services/firebase_auth_service.dart';
import 'package:screen_scene/core/utils/services/shared_preferences_singleton.dart';
import 'package:screen_scene/features/auth/presentation/views/signin_view.dart';
import 'package:screen_scene/features/home/views/home_view.dart';
import 'package:screen_scene/features/splash/presentation/views/get_started.dart';

import 'sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    executeNavigation();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppString.appName.toUpperCase(),
          textAlign: TextAlign.center,
          style: getBoldStyle(fontSize: FontSize.s28),
        ),
        const SizedBox(height: AppSize.s4),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: AppDuration.d2),
    );

    slidingAnimation = Tween<Offset>(
            begin: const Offset(
              AppSize.s0,
              AppSize.s10,
            ),
            end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }

  void executeNavigation() {
    bool kIsGetStarted = Prefs.getBool(BackEndPoints.kIsGetStarted) ?? false;
    bool kISChooseTheme = Prefs.getBool(BackEndPoints.kISChooseTheme) ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (kIsGetStarted && kISChooseTheme && mounted) {
        var isLoggedIn = FirebaseAuthService().isSignedIn();

        if (isLoggedIn) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeView(),
            ),
            (route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const SigninView(),
            ),
            (route) => false,
          );
        }
      } else if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const GetStartedView(),
          ),
          (route) => false,
        );
      }
    });
  }
}
