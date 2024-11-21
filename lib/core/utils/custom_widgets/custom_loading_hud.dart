import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/theme/theme_bloc/theme_bloc.dart';

class CustomLoadingHud extends StatelessWidget {
  const CustomLoadingHud({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(
        color: context.isDarkMode ? AppColors.gold : AppColors.darkGold,
      ),
      child: child,
    );
  }
}
