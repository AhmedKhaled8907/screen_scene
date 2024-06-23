import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/search/data/data_sources/base_search_remote_data_source.dart';
import 'package:movies_app/search/domain/repos/base_search_repo.dart';
import 'package:movies_app/search/domain/use_cases/get_search_movies_use_case.dart';
import 'package:movies_app/search/domain/use_cases/get_search_tvs_use_case.dart';
import 'package:movies_app/tvs/domain/entities/tv_entity.dart';

import '../../../core/error/failure.dart';

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
