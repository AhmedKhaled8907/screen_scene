import 'package:flutter/material.dart';

import '../../../../core/global/resources/colors_manager.dart';
import '../../../../core/global/resources/font_manager.dart';
import '../../../../core/global/resources/strings_manager.dart';
import '../../../../core/global/resources/styles_manager.dart';

class CancelTextButton extends StatelessWidget {
  const CancelTextButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        AppString.cancel,
        style: getSemiBoldStyle(fontSize: FontSize.s18).copyWith(
          color: AppColors.blueAccent,
        ),
      ),
    );
  }
}
