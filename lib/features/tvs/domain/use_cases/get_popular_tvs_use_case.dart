import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_cases/base_use_case.dart';
import '../entities/tv_entity.dart';
import '../repos/base_tv_repo.dart';

class GetPopularTvsUseCase extends BaseUseCase<List<TvEntity>, NoParams> {
  final BaseTvsRepo baseTvsRepo;

  GetPopularTvsUseCase(this.baseTvsRepo);

  @override
  Future<Either<Failure, List<TvEntity>>> call(NoParams params) async {
    return await baseTvsRepo.getPopularTvs();
  }
}
