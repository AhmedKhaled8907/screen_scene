import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/core/services/services_locator.dart';

import 'widgets/now_playing/now_playing_section.dart';
import '../../controller/movie_bloc/movie_bloc.dart';
import 'widgets/popular/popular_section.dart';
import '../custom_widgets/title_and_see_more.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: const SingleChildScrollView(
        key: Key(AppString.movieScrollViewKey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Now Playing movies section
            NowPlayingSection(),

            // popular movies section
            PopularSection(),

            // top rated movies section
            TopRatedSection(),

            SizedBox(height: AppSize.s24),
          ],
        ),
      ),
    );
  }
}
