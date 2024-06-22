import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/utils/use_cases/base_use_case.dart';
import 'package:movies_app/search/domain/entities/search_entity.dart';
import 'package:movies_app/search/domain/repos/base_search_repo.dart';

class GetMultiSearchUseCase
    extends BaseUseCase<List<SearchEntity>, SearchMultiParams> {
  final BaseSearchRepo baseSearchRepo;

  GetMultiSearchUseCase(this.baseSearchRepo);

  @override
  Future<Either<Failure, List<SearchEntity>>> call(
    SearchMultiParams params,
  ) async {
    return await baseSearchRepo.getMultiSearch(params);
  }
}

class SearchMultiParams extends Equatable {
  final String query;

  const SearchMultiParams({required this.query});

  @override
  List<Object> get props => [query];
}
