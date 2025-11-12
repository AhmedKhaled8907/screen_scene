import 'package:flutter/material.dart';

import '../../../global/resources/font_manager.dart';
import '../../../global/resources/styles_manager.dart';
import '../../../global/resources/values_manager.dart';

class DetailsNumOf extends StatelessWidget {
  const DetailsNumOf({
    super.key,
    required this.title,
    required this.numOf,
  });

  final String title;
  final String numOf;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title:  $numOf',
      style: getMediumStyle(
        fontSize: FontSize.s16,
        letterSpacing: AppSize.s1_25,
      ),
    );
  }
}
