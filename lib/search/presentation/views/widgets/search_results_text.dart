import 'package:flutter/material.dart';
import 'package:movies_app/search/domain/entities/search_entity.dart';

import '../../../../core/global/resources/font_manager.dart';
import '../../../../core/global/resources/styles_manager.dart';
import '../../../../core/global/resources/values_manager.dart';

class SearchResultText extends StatelessWidget {
  const SearchResultText({
    super.key,
    required this.searchEntity,
  });

  final SearchEntity searchEntity;

  @override
  Widget build(BuildContext context) {
    return Text(
      searchEntity.title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: getMediumStyle(
        fontSize: FontSize.s16,
        letterSpacing: AppSize.s1_25,
      ),
    );
  }
}
