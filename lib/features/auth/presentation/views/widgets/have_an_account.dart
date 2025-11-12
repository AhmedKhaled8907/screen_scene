import 'package:flutter/material.dart';

import '../../../../../core/global/resources/colors_manager.dart';
import '../../../../../core/global/resources/font_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import '../../../../../core/global/theme/theme_bloc/theme_bloc.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Have an account?',
          style: getSemiBoldStyle(
            fontSize: FontSize.s14,
            color: const Color(0xff949D9E),
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Sign In",
            style: getSemiBoldStyle(
              fontSize: FontSize.s14,
              color: context.isDarkMode ? AppColors.gold : AppColors.darkGold,
            ),
          ),
        ),
      ],
    );
  }
}
