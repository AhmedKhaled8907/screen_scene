import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/utils/enums.dart';
import 'package:screen_scene/features/tvs/domain/entities/similar_tvs_entity.dart';
import 'package:screen_scene/features/tvs/domain/use_cases/get_similar_tvs_use_case.dart';

part 'similar_tvs_event.dart';
part 'similar_tvs_state.dart';

class SimilarTvsBloc extends Bloc<SimilarTvsEvent, SimilarTvsState> {
  final GetSimilarTvsUseCase getSimilarTvsUseCase;
  SimilarTvsBloc(this.getSimilarTvsUseCase) : super(const SimilarTvsState()) {
    on<GetSimilarTvsEvent>(_getSimilarTvsEvent);
  }

  FutureOr<void> _getSimilarTvsEvent(
    GetSimilarTvsEvent event,
    Emitter<SimilarTvsState> emit,
  ) async {
    final result = await getSimilarTvsUseCase(SimilarTvsParams(
      id: event.id,
    ));
    result.fold(
      (l) => emit(
        state.copyWith(
          similarTvsState: RequestState.error,
          similarTvsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          similarTvs: r,
          similarTvsState: RequestState.loaded,
        ),
      ),
    );
  }
}
