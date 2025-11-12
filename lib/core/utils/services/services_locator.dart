import 'package:get_it/get_it.dart';

import '../../../features/auth/data/repos/auth_repo_impl.dart';
import '../../../features/auth/domain/repos/auth_repo.dart';
import '../../../features/home/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import '../../../features/movies/data/data_sources/base_movies_remote_data_source.dart';
import '../../../features/movies/data/data_sources/movies_remote_data_source.dart';
import '../../../features/movies/data/repos/movies_repo.dart';
import '../../../features/movies/domain/repos/base_movies_repo.dart';
import '../../../features/movies/domain/use_cases/get_movie_details_use_case.dart';
import '../../../features/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import '../../../features/movies/domain/use_cases/get_popular_movies_use_case.dart';
import '../../../features/movies/domain/use_cases/get_similar_movies_use_case.dart';
import '../../../features/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import '../../../features/movies/presentation/controller/movie_bloc/movie_bloc.dart';
import '../../../features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import '../../../features/movies/presentation/controller/similar_movies_bloc/similar_movies_bloc.dart';
import '../../../features/search/data/data_sources/base_search_remote_data_source.dart';
import '../../../features/search/data/data_sources/search_remote_data_source.dart';
import '../../../features/search/data/repos/search_repo.dart';
import '../../../features/search/domain/repos/base_search_repo.dart';
import '../../../features/search/domain/use_cases/get_search_movies_use_case.dart';
import '../../../features/search/domain/use_cases/get_search_tvs_use_case.dart';
import '../../../features/search/presentation/controller/search_bloc/search_bloc.dart';
import '../../../features/settings/presentation/display_user_info_cubit/display_user_info_cubit.dart';
import '../../../features/tvs/data/data_sources/base_tvs_remote_data_source.dart';
import '../../../features/tvs/data/data_sources/tvs_remote_data_source.dart';
import '../../../features/tvs/data/repos/tv_repo.dart';
import '../../../features/tvs/domain/repos/base_tv_repo.dart';
import '../../../features/tvs/domain/use_cases/get_on_the_air_tvs_use_case.dart';
import '../../../features/tvs/domain/use_cases/get_popular_tvs_use_case.dart';
import '../../../features/tvs/domain/use_cases/get_similar_tvs_use_case.dart';
import '../../../features/tvs/domain/use_cases/get_top_rated_tvs_user_case.dart';
import '../../../features/tvs/domain/use_cases/get_tv_details_use_case.dart';
import '../../../features/tvs/presentation/controller/tv_bloc/tv_bloc.dart';
import '../../../features/tvs/presentation/controller/tv_details_bloc/similar_tvs_bloc/similar_tvs_bloc.dart';
import '../../../features/tvs/presentation/controller/tv_details_bloc/tv_details_bloc.dart';
import 'database_service.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';

final sl = GetIt.instance;

void setupGetIt() {
  // Auth
  sl.registerSingleton<DatabaseService>(
    FirestoreService(),
  );
  sl.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );
  sl.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: sl<FirebaseAuthService>(),
      databaseService: sl<DatabaseService>(),
    ),
  );

  ///MOVIES Blocs
  sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
  sl.registerFactory(() => MovieDetailsBloc(sl()));
  sl.registerFactory(() => SimilarMoviesBloc(sl()));
  sl.registerFactory(() => BottomNavBarCubit());
  sl.registerFactory(() => DisplayUserInfoCubit());

  /// MOVIES USE CASES
  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetSimilarMoviesUseCase(sl()));

  ///MOVIES REPOS
  sl.registerLazySingleton<BaseMoviesRepo>(
    () => MoviesRepo(sl()),
  );

  ///MOVIES DATA SOURCES
  sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
    () => MoviesRemoteDataSource(),
  );

  /////////////////////////////////////////////////////////////////////

  /// TVS Blocs
  sl.registerFactory(() => TvBloc(sl(), sl(), sl()));
  sl.registerFactory(() => TvDetailsBloc(sl()));
  sl.registerFactory(() => SimilarTvsBloc(sl()));

  /// TVS USE CASES
  sl.registerLazySingleton(() => GetOnTheAirTvsUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularTvsUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedTvsUseCase(sl()));
  sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetSimilarTvsUseCase(sl()));

  /// TVS REPOS
  sl.registerLazySingleton<BaseTvsRepo>(
    () => TvsRepo(sl()),
  );

  /// TVS DATA SOURCES
  sl.registerLazySingleton<BaseTvsRemoteDataSource>(
    () => TvsRemoteDataSource(),
  );

  /////////////////////////////////////////////////////////////////////

  /// Search Blocs
  sl.registerFactory(() => SearchBloc(sl(), sl()));

  /// Search USE CASES
  sl.registerLazySingleton(() => GetSearchMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetSearchTvsUseCase(sl()));

  /// Search REPOS
  sl.registerLazySingleton<BaseSearchRepo>(
    () => SearchRepo(sl()),
  );

  /// Search DATA SOURCES
  sl.registerLazySingleton<BaseSearchRemoteDataSource>(
    () => SearchRemoteDataSource(),
  );
}
