import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../movies/domain/entities/movie_entity.dart';
import '../../../tvs/domain/entities/tv_entity.dart';
import '../../domain/repos/base_search_repo.dart';
import '../../domain/use_cases/get_search_movies_use_case.dart';
import '../../domain/use_cases/get_search_tvs_use_case.dart';
import '../data_sources/base_search_remote_data_source.dart';

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
