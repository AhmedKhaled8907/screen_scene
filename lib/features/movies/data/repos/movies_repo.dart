import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/features/movies/data/data_sources/base_movies_remote_data_source.dart';
import 'package:movies_app/features/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movies/domain/entities/similar_movies_entity.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_similar_movies_use_case.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repos/base_movies_repo.dart';

class MoviesRepo extends BaseMoviesRepo {
  final BaseMoviesRemoteDataSource remoteDataSource;
  MoviesRepo(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    final result = await remoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await remoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    final result = await remoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      MovieDetailsParams params) async {
    final result = await remoteDataSource.getMovieDetails(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<SimilarMoviesEntity>>> getSimilarMovies(
      SimilarMoviesParams params) async {
    final result = await remoteDataSource.getSimilarMovies(params);
    try {
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
