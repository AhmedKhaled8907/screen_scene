import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/similar_tvs_entity.dart';
import '../entities/tv_details_entity.dart';
import '../entities/tv_entity.dart';
import '../use_cases/get_similar_tvs_use_case.dart';
import '../use_cases/get_tv_details_use_case.dart';

abstract class BaseTvsRepo {
  Future<Either<Failure, List<TvEntity>>> getOnTheAirTvs();
  Future<Either<Failure, List<TvEntity>>> getPopularTvs();
  Future<Either<Failure, List<TvEntity>>> getTopRatedTvs();
  Future<Either<Failure, TvDetailsEntity>> getTvDetails(
    TvDetailsParams params,
  );
  Future<Either<Failure, List<SimilarTvsEntity>>> getSimilarTvs(
    SimilarTvsParams params,
  );
}
