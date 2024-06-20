import 'package:flutter/material.dart';


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
        style: const TextStyle(
          fontSize: 16,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
