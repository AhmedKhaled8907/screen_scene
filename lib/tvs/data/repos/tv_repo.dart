import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tvs/data/data_sources/base_tvs_remote_data_source.dart';
import 'package:movies_app/tvs/domain/entities/tv_entity.dart';
import 'package:movies_app/tvs/domain/repos/base_tv_repo.dart';

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

  // @override
  // Future<Either<Failure, TvDetailsEntity>> getTvDetails(
  //     TvDetailsParams params) async {
  //   final result = await remoteDataSource.getTvDetails(params);
  //   try {
  //     return Right(result);
  //   } on ServerException catch (failure) {
  //     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  //   }
  // }

  // @override
  // Future<Either<Failure, List<SimilarTvsEntity>>> getSimilarTvs(
  //     SimilarTvsParams params) async {
  //   final result = await remoteDataSource.getSimilarTvs(params);
  //   try {
  //     return Right(result);
  //   } catch (e) {
  //     return Left(ServerFailure(e.toString()));
  //   }
  // }

}
