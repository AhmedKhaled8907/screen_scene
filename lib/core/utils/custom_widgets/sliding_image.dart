import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../global/resources/colors_manager.dart';
import '../../global/resources/values_manager.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    super.key,
    required this.posterPath,
  });
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CachedNetworkImage(
      width: double.infinity,
      height: size.height * AppSize.s0_5,
      imageUrl: posterPath,
      fit: BoxFit.fill,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[AppColorShades.colorShade850]!,
        highlightColor: AppColors.greyWithShade,
        child: Container(
          height: size.height * AppSize.s0_5,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(AppRadius.r8),
          ),
        ),
      ),
    );
  }
}
