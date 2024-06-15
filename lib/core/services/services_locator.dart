import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_sources/base_movies_remote_data_source.dart';
import 'package:movies_app/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repos/movies_repo.dart';
import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// DATA SOURCES
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );

    /// REPOS
    sl.registerLazySingleton<BaseMoviesRepo>(
      () => MoviesRepo(sl()),
    );

    /// USE CASES
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
      () => sl(),
    );
  }
}
