import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

class SeeMoreTitle extends StatelessWidget {
  const SeeMoreTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: getBoldStyle(
        letterSpacing: AppSize.s1_25,
        fontSize: AppSize.s18,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
