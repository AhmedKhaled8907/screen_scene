import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

class MoreLikeThisText extends StatelessWidget {
  const MoreLikeThisText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(
        AppSize.s16,
        AppSize.s16,
        AppSize.s16,
        AppSize.s24,
      ),
      sliver: SliverToBoxAdapter(
        child: FadeInUp(
          from: AppConstants.fromFadeInUp,
          duration: const Duration(milliseconds: AppDuration.d500),
          child: Text(
            AppString.moreLikeThis.toUpperCase(),
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
