import 'package:flutter/material.dart';

import '../../global/resources/colors_manager.dart';
import '../../global/theme/theme_bloc/theme_bloc.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: context.isDarkMode ? AppColors.gold : AppColors.darkGold,
        ),
      ),
    );
  }
}
