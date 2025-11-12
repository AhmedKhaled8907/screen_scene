import 'package:flutter/material.dart';

import '../../../global/resources/colors_manager.dart';
import '../../../global/resources/font_manager.dart';
import '../../../global/resources/styles_manager.dart';

class SeeMoreOverViewText extends StatelessWidget {
  const SeeMoreOverViewText({
    super.key,
    required this.overView,
  });

  final String overView;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        overView,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: getRegularStyle(
          fontSize: FontSize.s16,
        ).copyWith(color: AppColors.white),
      ),
    );
  }
}
