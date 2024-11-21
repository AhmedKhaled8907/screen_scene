import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_cases/base_use_case.dart';
import '../../../tvs/domain/entities/tv_entity.dart';
import '../repos/base_search_repo.dart';

class GetSearchTvsUseCase extends BaseUseCase<List<TvEntity>, SearchTvsParams> {
  final BaseSearchRepo baseSearchRepo;

  GetSearchTvsUseCase(this.baseSearchRepo);

  @override
  Future<Either<Failure, List<TvEntity>>> call(
    SearchTvsParams params,
  ) async {
    return await baseSearchRepo.getTvsSearch(params);
  }
}

class SearchTvsParams extends Equatable {
  final String query;

  const SearchTvsParams({required this.query});

  @override
  List<Object> get props => [query];
}
