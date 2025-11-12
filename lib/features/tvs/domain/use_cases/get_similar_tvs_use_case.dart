import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_cases/base_use_case.dart';
import '../entities/similar_tvs_entity.dart';
import '../repos/base_tv_repo.dart';

class GetSimilarTvsUseCase
    extends BaseUseCase<List<SimilarTvsEntity>, SimilarTvsParams> {
  final BaseTvsRepo baseTvsRepo;

  GetSimilarTvsUseCase(this.baseTvsRepo);

  @override
  Future<Either<Failure, List<SimilarTvsEntity>>> call(
      SimilarTvsParams params) async {
    return await baseTvsRepo.getSimilarTvs(params);
  }
}

class SimilarTvsParams extends Equatable {
  final int id;

  const SimilarTvsParams({required this.id});

  @override
  List<Object> get props => [id];
}
