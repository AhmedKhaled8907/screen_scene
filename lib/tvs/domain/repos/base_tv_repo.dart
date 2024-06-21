import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tvs/domain/entities/tv_entity.dart';

abstract class BaseTvsRepo {
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTvs();
  Future<Either<Failure, List<TvEntity>>> getPopularTvs();
  Future<Either<Failure, List<TvEntity>>> getTopRatedTvs();
  // Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
  //   MovieDetailsParams params,
  // );
  // Future<Either<Failure, List<SimilarTvsEntity>>> getSimilarTvs(
  //   SimilarTvsParams params,
  // );
}
