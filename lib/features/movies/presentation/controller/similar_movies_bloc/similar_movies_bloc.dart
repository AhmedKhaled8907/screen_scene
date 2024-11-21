import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/utils/enums.dart';
import 'package:screen_scene/features/movies/domain/entities/similar_movies_entity.dart';
import 'package:screen_scene/features/movies/domain/use_cases/get_similar_movies_use_case.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  SimilarMoviesBloc(this.getSimilarMoviesUseCase)
      : super(const SimilarMoviesState()) {
    on<GetSimilarMoviesEvent>(_getSimilarMoviesEvent);
  }

  FutureOr<void> _getSimilarMoviesEvent(
    GetSimilarMoviesEvent event,
    Emitter<SimilarMoviesState> emit,
  ) async {
    final result = await getSimilarMoviesUseCase(SimilarMoviesParams(
      movieId: event.movieId,
    ));
    result.fold(
      (l) => emit(
        state.copyWith(
          similarMoviesState: RequestState.error,
          similarMoviesMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          similarMovies: r,
          similarMoviesState: RequestState.loaded,
        ),
      ),
    );
  }
}
