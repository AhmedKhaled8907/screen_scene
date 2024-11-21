import 'package:dartz/dartz.dart';
import 'package:screen_scene/core/error/exceptions.dart';
import 'package:screen_scene/core/error/failure.dart';
import 'package:screen_scene/features/tvs/data/data_sources/base_tvs_remote_data_source.dart';
import 'package:screen_scene/features/tvs/domain/entities/similar_tvs_entity.dart';
import 'package:screen_scene/features/tvs/domain/entities/tv_details_entity.dart';
import 'package:screen_scene/features/tvs/domain/entities/tv_entity.dart';
import 'package:screen_scene/features/tvs/domain/repos/base_tv_repo.dart';
import 'package:screen_scene/features/tvs/domain/use_cases/get_similar_tvs_use_case.dart';
import 'package:screen_scene/features/tvs/domain/use_cases/get_tv_details_use_case.dart';

class TvsRepo extends BaseTvsRepo {
  final BaseTvsRemoteDataSource remoteDataSource;
  TvsRepo(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTvs() async {
    final result = await remoteDataSource.getOnTheAirTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getPopularTvs() async {
    final result = await remoteDataSource.getPopularTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEntity>>> getTopRatedTvs() async {
    final result = await remoteDataSource.getTopRatedTvs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetailsEntity>> getTvDetails(
      TvDetailsParams params) async {
    final result = await remoteDataSource.getTvDetails(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SimilarTvsEntity>>> getSimilarTvs(
      SimilarTvsParams params) async {
    final result = await remoteDataSource.getSimilarTvs(params);
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
