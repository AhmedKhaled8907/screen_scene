import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_cases/base_use_case.dart';
import '../entities/tv_entity.dart';
import '../repos/base_tv_repo.dart';

class GetOnTheAirTvsUseCase extends BaseUseCase<List<TvEntity>, NoParams> {
  final BaseTvsRepo baseTvRepo;

  GetOnTheAirTvsUseCase(this.baseTvRepo);

  @override
  Future<Either<Failure, List<TvEntity>>> call(NoParams params) async {
    return await baseTvRepo.getOnTheAirTvs();
  }
}
