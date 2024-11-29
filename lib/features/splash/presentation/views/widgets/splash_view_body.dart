import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:screen_scene/core/back_end_points.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/core/utils/services/firebase_auth_service.dart';
import 'package:screen_scene/core/utils/services/shared_preferences_singleton.dart';
import 'package:screen_scene/features/auth/presentation/views/signin_view.dart';
import 'package:screen_scene/features/home/views/home_view.dart';
import 'package:screen_scene/features/splash/presentation/views/get_started.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    executeNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppSize.s200,
        child: SvgPicture.asset(
          'assets/images/logo.svg',
        ),
      ),
    );
  }

  void executeNavigation() {
    bool kIsGetStarted = Prefs.getBool(BackEndPoints.kIsGetStarted) ?? false;
    bool kISChooseTheme = Prefs.getBool(BackEndPoints.kISChooseTheme) ?? false;

    Future.delayed(const Duration(seconds: AppDuration.d4), () {
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
