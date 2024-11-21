import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/strings_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/features/search/presentation/views/widgets/cancel_text_button.dart';

class SearchBarItems extends StatelessWidget {
  final TextEditingController? controller;
  final void Function()? clearSearch;
  final FocusNode focusNode;

  const SearchBarItems({
    required this.controller,
    required this.clearSearch,
    super.key,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              cursorColor: AppColors.gold,
              style: getMediumStyle(fontSize: FontSize.s16).copyWith(
                color: AppColors.black,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p16,
                  horizontal: AppPadding.p6,
                ),
                hintText: '${AppString.search} ${AppString.appName}',
                hintStyle: getMediumStyle(fontSize: FontSize.s14).copyWith(
                  color: AppColors.grey,
                ),
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: AppColors.grey,
                filled: true,
                fillColor: AppColors.white,
                border: _outlineInputBorder(),
                enabledBorder: _outlineInputBorder(),
                focusedBorder: _outlineInputBorder(),
              ),
            ),
          ),
          CancelTextButton(onPressed: clearSearch),
        ],
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        AppRadius.r16,
      ),
      borderSide: BorderSide.none,
    );
  }
}
