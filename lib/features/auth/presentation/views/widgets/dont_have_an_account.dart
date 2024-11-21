import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';

import '../signup_view.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: getSemiBoldStyle(
            color: const Color(0xff949D9E),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignupView(),
              ),
            );
          },
          child: Text(
            "Create Account",
            style: getSemiBoldStyle(
              color: AppColors.gold,
            ),
          ),
        ),
      ],
    );
  }
}
