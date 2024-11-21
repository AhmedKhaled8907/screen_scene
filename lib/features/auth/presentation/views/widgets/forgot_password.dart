import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';

import '../forgot_password_view.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ForgotPasswordView.routeName,
        );
      },
      child: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Text(
          'Forgot Password?',
          style: getSemiBoldStyle(
            color: AppColors.gold,
          ),
        ),
      ),
    );
  }
}
