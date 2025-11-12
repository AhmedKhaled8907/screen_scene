import 'package:flutter/material.dart';

import '../../../global/resources/styles_manager.dart';

class DetailsTitle extends StatelessWidget {
  const DetailsTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getBoldStyle(),
    );
  }
}
