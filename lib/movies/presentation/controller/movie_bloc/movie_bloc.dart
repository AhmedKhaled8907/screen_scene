import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MovieBloc(this.getNowPlayingMoviesUseCase) : super(const MovieState()) {
    getNowPlayingMoviesEvent();
  }

  void getNowPlayingMoviesEvent() {
    return on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MovieState(nowPlayingState: RequestState.loaded));
      result.fold(
        (failure) => emit(
          MovieState(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: failure.message,
          ),
        ),
        (result) => emit(
          MovieState(
            nowPlayingMovies: result,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
