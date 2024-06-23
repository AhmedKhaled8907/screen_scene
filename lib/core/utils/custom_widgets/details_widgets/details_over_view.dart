import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';

import '../../../global/resources/colors_manager.dart';
import '../../../global/resources/strings_manager.dart';

class DetailsOverView extends StatefulWidget {
  const DetailsOverView({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  State<DetailsOverView> createState() => _DetailsOverViewState();
}

class _DetailsOverViewState extends State<DetailsOverView> {
  bool _isDataHidden = true;

  void _toggleDataVisibility() {
    setState(() {
      _isDataHidden = !_isDataHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool shouldShowToggle = widget.overview.length > 170;

    return GestureDetector(
      onTap: shouldShowToggle ? _toggleDataVisibility : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isDataHidden && shouldShowToggle
                ? '${widget.overview.substring(0, 170)}...'
                : widget.overview,
            style: getRegularStyle(
              letterSpacing: AppSize.s1_25,
              fontSize: FontSize.s14,
            ),
          ),
          if (shouldShowToggle)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppSize.s8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      _isDataHidden
                          ? Icons.keyboard_arrow_down_rounded
                          : Icons.keyboard_arrow_up_rounded,
                      size: AppSize.s30,
                      color: AppColors.red,
                    ),
                    const SizedBox(width: AppSize.s4),
                    Text(
                      _isDataHidden ? AppString.more : AppString.less,
                      style: getSemiBoldStyle(fontSize: FontSize.s20).copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
