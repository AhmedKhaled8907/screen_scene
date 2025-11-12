import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../movies/domain/entities/movie_entity.dart';
import '../../../tvs/domain/entities/tv_entity.dart';
import '../use_cases/get_search_movies_use_case.dart';
import '../use_cases/get_search_tvs_use_case.dart';

abstract class BaseSearchRepo {
  Future<Either<Failure, List<MovieEntity>>> getMoviesSearch(
    SearchMoviesParams params,
  );
  Future<Either<Failure, List<TvEntity>>> getTvsSearch(
    SearchTvsParams params,
  );
  // Future<Either<Failure, List<MovieEntity>>> getPeopleSearch();
  // Future<Either<Failure, SearchDetailsEntity>> getSearchDetails(
  //   SearchDetailsParams params,
  // );
  // Future<Either<Failure, List<SimilarSearchEntity>>> getSimilarSearch(
  //   SimilarSearchParams params,
  // );
}
