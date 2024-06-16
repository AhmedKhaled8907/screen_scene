import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_top_rated_movies_use_case.dart';

import '../../../domain/use_cases/get_popular_movies_use_case.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    getNowPlayingMoviesEvent();
    getPopularMoviesEvent();
    getTopRatedMoviesEvent();
  }

  void getNowPlayingMoviesEvent() {
    return on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      // emit(const MovieState(nowPlayingState: RequestState.loaded));
      result.fold(
        (failure) => emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: failure.message,
          ),
        ),
        (result) => emit(
          state.copyWith(
            nowPlayingMovies: result,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
  }

  void getPopularMoviesEvent() {
    return on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      // emit(const MovieState(popularState: RequestState.loaded));
      result.fold(
        (failure) => emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: failure.message,
          ),
        ),
        (result) => emit(
          state.copyWith(
            popularMovies: result,
            popularState: RequestState.loaded,
          ),
        ),
      );
    });
  }

  void getTopRatedMoviesEvent() {
    return on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();
      // emit(const MovieState(TopRatedState: RequestState.loaded));
      result.fold(
        (failure) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: failure.message,
          ),
        ),
        (result) => emit(
          state.copyWith(
            topRatedMovies: result,
            topRatedState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
