import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/services/services_locator.dart';
import 'package:movies_app/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';

import 'tv_details_view_body.dart';

class TvDetailView extends StatelessWidget {
  final int id;

  const TvDetailView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<TvDetailsBloc>()
            ..add(
              GetTvDetailsEvent(id: id),
            ),
          lazy: false,
        ),
        // BlocProvider(
        //   create: (context) => sl<SimilarTvsBloc>()
        //     ..add(
        //       GetSimilarTvsEvent(TvId: id),
        //     ),
        //   lazy: false,
        // ),
      ],
      child: const Scaffold(
        body: TvDetailsViewBody(),
      ),
    );
  }
}

