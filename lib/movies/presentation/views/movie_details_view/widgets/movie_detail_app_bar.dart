import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';

class MovieDetailsAppBar extends StatelessWidget {
  const MovieDetailsAppBar({
    super.key,
    required this.movie,
  });

  final MovieDetailsEntity? movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: AppSize.s250,
      leading: Container(
        margin: const EdgeInsets.only(left: AppMargin.m4),
        decoration: BoxDecoration(
          color: Colors.grey[AppColorShades.colorShade850], // Set your desired background color here
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.transparent,
                  AppColors.black,
                  AppColors.black,
                  AppColors.transparent,
                ],
                stops: const [AppSize.s0, AppSize.s0_5, AppSize.s1, AppSize.s1],
              ).createShader(
                Rect.fromLTRB(AppSize.s0, AppSize.s0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              imageUrl: ApiConstants.imageUrl(movie!.backdropPath!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
