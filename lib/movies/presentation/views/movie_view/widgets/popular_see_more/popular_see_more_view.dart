import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/font_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:shimmer/shimmer.dart';

import 'dummy.dart';

class PopularSeeMoreView extends StatelessWidget {
  const PopularSeeMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const PopularSeeMoreViewBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        AppString.popularMovies,
        style: getBoldStyle(),
      ),
      centerTitle: true,
    );
  }
}

class PopularSeeMoreViewBody extends StatelessWidget {
  const PopularSeeMoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DummyModel> list = dummyList;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return PopularSeeMoreViewItem(dummy: list[index]);
      },
    );
  }
}

class PopularSeeMoreViewItem extends StatelessWidget {
  const PopularSeeMoreViewItem({
    super.key,
    required this.dummy,
  });

  final DummyModel dummy;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: AppDuration.d500),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.s4,
          vertical: AppSize.s4,
        ),
        child: IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p8,
              horizontal: AppPadding.p4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r8),
              color: Colors.grey[AppColorShades.colorShade800],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: AppPadding.p8),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppRadius.r8),
                    ),
                    child: CachedNetworkImage(
                      width: AppSize.s120,
                      height: AppSize.s150,
                      fit: BoxFit.cover,
                      imageUrl: ApiConstants.imageUrl(dummy.image),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[AppColorShades.colorShade850]!,
                        highlightColor:
                            Colors.grey[AppColorShades.colorShade800]!,
                        child: Container(
                          height: AppSize.s250,
                          width: AppSize.s120,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(AppRadius.r8),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppSize.s8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dummy.title,
                          maxLines: 1,
                          style: getBoldStyle(
                            letterSpacing: AppSize.s1_25,
                            fontSize: AppSize.s18,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: AppSize.s16),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p2,
                                horizontal: AppSize.s8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.r4),
                              ),
                              child: Text(
                                dummy.releaseDate
                                    .split('-')[AppSize.s0.toInt()],
                                style: getMediumStyle(
                                  fontSize: AppSize.s16,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSize.s16),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: AppSize.s20,
                                ),
                                const SizedBox(width: AppSize.s4),
                                Text(
                                  (dummy.voteAverage / AppSize.s2)
                                      .toStringAsFixed(1),
                                  style: getMediumStyle(
                                    fontSize: FontSize.s16,
                                    letterSpacing: AppSize.s1_25,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s16),
                        Flexible(
                          child: Text(
                            dummy.overView,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
