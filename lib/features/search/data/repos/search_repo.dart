import 'package:dartz/dartz.dart';
import 'package:screen_scene/core/error/exceptions.dart';
import 'package:screen_scene/features/movies/domain/entities/movie_entity.dart';
import 'package:screen_scene/features/search/data/data_sources/base_search_remote_data_source.dart';
import 'package:screen_scene/features/search/domain/repos/base_search_repo.dart';
import 'package:screen_scene/features/search/domain/use_cases/get_search_movies_use_case.dart';
import 'package:screen_scene/features/search/domain/use_cases/get_search_tvs_use_case.dart';
import 'package:screen_scene/features/tvs/domain/entities/tv_entity.dart';

import '../../../../core/error/failure.dart';

class SearchRepo extends BaseSearchRepo {
  final BaseSearchRemoteDataSource remoteDataSource;
  SearchRepo(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesSearch(
    SearchMoviesParams params,
  ) async {
    final result = await remoteDataSource.getMoviesSearch(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getTvsSearch(
    SearchTvsParams params,
  ) async {
    final result = await remoteDataSource.getTvsSearch(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
