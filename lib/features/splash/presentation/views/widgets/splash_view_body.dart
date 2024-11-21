import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen_scene/core/back_end_points.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/services/firebase_auth_service.dart';
import 'package:screen_scene/core/utils/services/shared_preferences_singleton.dart';
import 'package:screen_scene/features/auth/presentation/views/signin_view.dart';
import 'package:screen_scene/features/home/views/home_view.dart';
import 'package:screen_scene/features/splash/presentation/views/get_started.dart';
import 'package:screen_scene/features/splash/presentation/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> slidingAnimation;
  late AnimationController animationController;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          'assets/images/splash_bottom.svg',
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            AppColors.gold,
            BlendMode.srcIn,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: AppSize.s200,
              child: SvgPicture.asset(
                'assets/images/logo.svg',
              ),
            ),
            const SizedBox(height: AppSize.s8),
            SlidingText(slidingAnimation: slidingAnimation),
          ],
        ),
        Transform.flip(
          flipY: true,
          child: SvgPicture.asset(
            'assets/images/splash_bottom.svg',
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              AppColors.gold,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  void executeNavigation() {
    bool kIsGetStarted = Prefs.getBool(BackEndPoints.kIsGetStarted) ?? false;
    bool kISChooseTheme = Prefs.getBool(BackEndPoints.kISChooseTheme) ?? false;

    Future.delayed(const Duration(seconds: AppDuration.d5), () {
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
