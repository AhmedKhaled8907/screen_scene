import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

class NowPlayingAndOnAirText extends StatelessWidget {
  const NowPlayingAndOnAirText({
    super.key,
    required this.title,
    required this.itemText,
  });

  final String title;
  final String itemText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.circle,
                  color: AppColors.redAccent,
                  size: AppSize.s16,
                ),
                const SizedBox(width: AppSize.s4),
                Text(
                  itemText.toUpperCase(),
                  style: getRegularStyle(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppPadding.p16,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: getBoldStyle(
                letterSpacing: AppSize.s1_25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
