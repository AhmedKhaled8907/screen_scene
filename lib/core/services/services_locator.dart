import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_sources/base_movies_remote_data_source.dart';
import 'package:movies_app/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repos/movies_repo.dart';
import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_similar_movies_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/similar_movies_bloc/similar_movies_bloc.dart';

import '../../movies/domain/use_cases/get_top_rated_movies_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Blocs
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => SimilarMoviesBloc(sl()));

    /// USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetSimilarMoviesUseCase(sl()));

    /// REPOS
    sl.registerLazySingleton<BaseMoviesRepo>(
      () => MoviesRepo(sl()),
    );

    /// DATA SOURCES
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
