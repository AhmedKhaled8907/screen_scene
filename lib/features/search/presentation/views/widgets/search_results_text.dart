import 'package:flutter/material.dart';

import '../../../../../core/global/resources/font_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import '../../../../../core/global/resources/values_manager.dart';

class SearchResultText extends StatelessWidget {
  const SearchResultText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: getMediumStyle(
        fontSize: FontSize.s16,
        letterSpacing: AppSize.s1_25,
      ),
    );
  }
}
