import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/theme/theme_bloc/theme_bloc.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.isDarkMode ? Color(0xffDDDFDF) : Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Or",
            style: getSemiBoldStyle(fontSize: FontSize.s16),
          ),
        ),
        Expanded(
          child: Divider(
            color: context.isDarkMode ? Color(0xffDDDFDF) : Colors.black,
          ),
        ),
      ],
    );
  }
}
