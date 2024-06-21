import 'package:dartz/dartz.dart';
import 'package:movies_app/search/domain/entities/search_entity.dart';
import 'package:movies_app/search/domain/use_cases/get_search_multi_use_case.dart';

import '../../../core/error/failure.dart';

abstract class BaseSearchRepo {
  Future<Either<Failure, List<SearchEntity>>> getMultiSearch(
    SearchMultiParams params,
  );
  // Future<Either<Failure, List<SearchEntity>>> getPopularSearch();
  // Future<Either<Failure, List<SearchEntity>>> getTopRatedSearch();
  // Future<Either<Failure, SearchDetailsEntity>> getSearchDetails(
  //   SearchDetailsParams params,
  // );
  // Future<Either<Failure, List<SimilarSearchEntity>>> getSimilarSearch(
  //   SimilarSearchParams params,
  // );
}
