import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/search/data/data_sources/base_search_remote_data_source.dart';
import 'package:movies_app/search/domain/entities/search_entity.dart';
import 'package:movies_app/search/domain/repos/base_search_repo.dart';
import 'package:movies_app/search/domain/use_cases/get_search_multi_use_case.dart';

import '../../../core/error/failure.dart';

class SearchRepo extends BaseSearchRepo {
  final BaseSearchRemoteDataSource remoteDataSource;
  SearchRepo(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SearchEntity>>> getMultiSearch(
    SearchMultiParams params,
  ) async {
    final result = await remoteDataSource.getMultiSearch(params);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
