import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/data/repos/movies_repo.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';

import '../../../data/data_sources/base_movies_remote_data_source.dart';
import '../../../data/data_sources/movies_remote_data_source.dart';
import '../../../domain/repos/base_movies_repo.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieState()) {
    getNowPlayingMoviesEvent();
  }

  void getNowPlayingMoviesEvent() {
    return on<GetNowPlayingMoviesEvent>((event, emit) async {
      BaseMoviesRemoteDataSource remoteDataSource = MoviesRemoteDataSource();
      BaseMoviesRepo baseMoviesRepo = MoviesRepo(remoteDataSource);
      final result = await GetNowPlayingMoviesUseCase(baseMoviesRepo).execute();
      emit(const MovieState(nowPlayingState: RequestState.loaded));
      result.fold(
        (l) => emit(
          MovieState(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          MovieState(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
