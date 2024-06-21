import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_cases/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/tvs/domain/entities/tv_entity.dart';

import 'package:movies_app/tvs/domain/use_cases/get_on_the_air_tvs_use_case.dart';
import 'package:movies_app/tvs/domain/use_cases/get_popular_tvs_use_case.dart';
import 'package:movies_app/tvs/domain/use_cases/get_top_rated_tvs_user_case.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnTheAirTvsUseCase getOnTheAirTvsUseCase;
  final GetPopularTvsUseCase getPopularTvsUseCase;
  final GetTopRatedTvsUseCase getTopRatedTvsUseCase;
  TvBloc(
    this.getOnTheAirTvsUseCase,
    this.getPopularTvsUseCase,
    this.getTopRatedTvsUseCase,
  ) : super(const TvState()) {
    on<GetOnTheAirTvsEvent>(_getonTheAirStateTvs);

    on<GetPopularTvsEvent>(_getPopularTvs);

    on<GetTopRatedTvsEvent>(_getTopRatedTvs);
  }

  FutureOr<void> _getonTheAirStateTvs(
    GetOnTheAirTvsEvent event,
    Emitter<TvState> emit,
  ) async {
    final result = await getOnTheAirTvsUseCase(const NoParams());
    result.fold(
      (l) => emit(state.copyWith(
        onTheAirState: RequestState.error,
        popularMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          onTheAirTvs: r,
          onTheAirState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularTvs(
    GetPopularTvsEvent event,
    Emitter<TvState> emit,
  ) async {
    final result = await getPopularTvsUseCase(const NoParams());

    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularTvs: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedTvs(
    GetTopRatedTvsEvent event,
    Emitter<TvState> emit,
  ) async {
    final result = await getTopRatedTvsUseCase(const NoParams());

    result.fold(
      (l) => emit(state.copyWith(
        topRatedMessage: l.message,
        topRatedState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          topRatedTvs: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}

