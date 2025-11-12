import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../global/resources/constants_manager.dart';
import '../../../global/resources/font_manager.dart';
import '../../../global/resources/strings_manager.dart';
import '../../../global/resources/styles_manager.dart';
import '../../../global/resources/values_manager.dart';

class MoreLikeThisText extends StatelessWidget {
  const MoreLikeThisText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSize.s16,
        AppSize.s16,
        AppSize.s16,
        AppSize.s16,
      ),
      sliver: SliverToBoxAdapter(
        child: FadeInUp(
          from: AppConstants.fromFadeInUp,
          duration: const Duration(milliseconds: AppDuration.d500),
          child: Text(
            AppString.moreLikeThis.toUpperCase(),
            style: getMediumStyle(
              fontSize: FontSize.s16,
              letterSpacing: AppSize.s1_25,
            ),
          ),
        ),
      ),
    );
  }
}
