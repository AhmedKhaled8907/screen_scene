import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/utils/custom_widgets/custom_loading_indicator.dart';
import 'package:movies_app/core/utils/custom_widgets/title_with_shader.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import 'package:movies_app/tvs/presentation/views/tv_details_view/tv_details_view.dart';

class OnTheAirSection extends StatelessWidget {
  const OnTheAirSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.onTheAirState != current.onTheAirState,
      builder: (context, state) {
        switch (state.onTheAirState) {
          case RequestState.loading:
            return CustomLoadingIndicator(
              height: size.height * AppSize.s0_5,
            );

          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: AppDuration.d500),
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  height: size.height * AppSize.s0_5,
                  viewportFraction: AppConstants.viewportFraction,
                  onPageChanged: (index, reason) {},
                ),
                items: state.onTheAirTvs.map(
                  (item) {
                    return GestureDetector(
                      key: const Key(AppString.openTVMinimalDetailKey),
                      onTap: () {
                        /// TODO : NAVIGATE TO Tv DETAILS
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TvDetailView(
                            id: item.id,
                          ),
                        ));
                      },
                      child: TitleWithShade(
                        posterPath: item.posterPath,
                        title: item.title,
                      ),
                    );
                  },
                ).toList(),
              ),
            );

          case RequestState.error:
            return Center(
              child: Text(state.onTheAirMessage),
            );
        }
      },
    );
  }
}
