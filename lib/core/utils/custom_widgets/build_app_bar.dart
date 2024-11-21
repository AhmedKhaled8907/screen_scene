import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/font_manager.dart';
import 'package:screen_scene/core/global/resources/styles_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';

AppBar buildAppBar(
  BuildContext context, {
  required String title,
  bool? showLeading = true,
}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    title: Padding(
      padding: const EdgeInsets.only(top: AppPadding.p16),
      child: Text(
        title,
        style: getBoldStyle(
          fontSize: FontSize.s20,
        ),
      ),
    ),
    centerTitle: true,
    leading: showLeading!
        ? Padding(
            padding: const EdgeInsets.only(top: AppPadding.p16),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        : const SizedBox.shrink(),
  );
}
