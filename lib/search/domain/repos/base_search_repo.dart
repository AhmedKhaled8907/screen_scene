import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/search/domain/use_cases/get_search_movies_use_case.dart';

import '../../../core/error/failure.dart';

abstract class BaseSearchRepo {
  Future<Either<Failure, List<MovieEntity>>> getMoviesSearch(
    SearchMoviesParams params,
  );
  // Future<Either<Failure, List<MovieEntity>>> getTvsSearch();
  // Future<Either<Failure, List<MovieEntity>>> getPeopleSearch();
  // Future<Either<Failure, SearchDetailsEntity>> getSearchDetails(
  //   SearchDetailsParams params,
  // );
  // Future<Either<Failure, List<SimilarSearchEntity>>> getSimilarSearch(
  //   SimilarSearchParams params,
  // );
}
