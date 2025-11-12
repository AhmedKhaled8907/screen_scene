import 'package:flutter/material.dart';
import '../../../global/resources/font_manager.dart';
import '../../../global/resources/strings_manager.dart';
import '../../../global/resources/styles_manager.dart';
import '../../../global/resources/values_manager.dart';

class TitleAndSeeMore extends StatelessWidget {
  const TitleAndSeeMore({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        AppPadding.p16,
        AppPadding.p24,
        AppPadding.p16,
        AppPadding.p8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getMediumStyle(
              letterSpacing: AppSize.s0_15,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(AppRadius.r8),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: [
                  Text(
                    AppString.seeMore,
                    style: getRegularStyle(
                      fontSize: FontSize.s14,
                    ),
                  ),
                  const SizedBox(width: AppSize.s4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: AppSize.s16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
