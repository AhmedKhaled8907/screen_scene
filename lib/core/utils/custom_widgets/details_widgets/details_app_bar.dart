import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../global/resources/api_constants_manager.dart';
import '../../../global/resources/colors_manager.dart';
import '../../../global/resources/values_manager.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.posterPath,
  });

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: AppSize.s250,
      leading: Container(
        margin: const EdgeInsets.only(left: AppMargin.m8),
        decoration: BoxDecoration(
          color: AppColors.greyWithShade,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: AppSize.s24,
            color: AppColors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: AppDuration.d500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.transparent,
                  AppColors.black,
                  AppColors.black,
                  AppColors.transparent,
                ],
                stops: [AppSize.s0, AppSize.s0_3, AppSize.s1, AppSize.s1],
              ).createShader(
                Rect.fromLTRB(
                  AppSize.s0,
                  AppSize.s0,
                  rect.width,
                  rect.height,
                ),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              imageUrl: ApiConstants.imageUrl(posterPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
