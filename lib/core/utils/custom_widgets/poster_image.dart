import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:screen_scene/core/global/resources/api_constants_manager.dart';
import 'package:screen_scene/core/global/resources/colors_manager.dart';
import 'package:screen_scene/core/global/resources/values_manager.dart';
import 'package:screen_scene/features/movies/presentation/views/movie_details_view/similar_movies/similar_movies_section.dart';
import 'package:shimmer/shimmer.dart';

class PosterImage extends StatelessWidget {
  const PosterImage({
    super.key,
    required this.posterPath,
  });

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p8),
      child: BlackBorder(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppRadius.r8),
          ),
          child: CachedNetworkImage(
            height: AppSize.s170,
            width: AppSize.s120,
            fit: BoxFit.cover,
            imageUrl: ApiConstants.imageUrl(posterPath),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[AppColorShades.colorShade850]!,
              highlightColor: Colors.grey[AppColorShades.colorShade800]!,
              child: Container(
                height: AppSize.s170,
                width: AppSize.s120,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(AppRadius.r8),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
