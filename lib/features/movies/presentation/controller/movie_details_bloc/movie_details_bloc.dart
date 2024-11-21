import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/core/utils/enums.dart';
import 'package:screen_scene/features/movies/domain/entities/movie_details_entity.dart';
import 'package:screen_scene/features/movies/domain/use_cases/get_movie_details_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParams(movieId: event.movieId),
    );
    result.fold(
      (l) => emit(
        MovieDetailsState(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        MovieDetailsState(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }
}
