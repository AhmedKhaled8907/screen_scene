import 'package:dartz/dartz.dart';
import 'package:screen_scene/core/error/failure.dart';
import 'package:screen_scene/core/utils/use_cases/base_use_case.dart';
import 'package:screen_scene/features/tvs/domain/entities/tv_entity.dart';
import 'package:screen_scene/features/tvs/domain/repos/base_tv_repo.dart';

class GetOnTheAirTvsUseCase extends BaseUseCase<List<TvEntity>, NoParams> {
  final BaseTvsRepo baseTvRepo;

  GetOnTheAirTvsUseCase(this.baseTvRepo);

  @override
  Future<Either<Failure, List<TvEntity>>> call(NoParams params) async {
    return await baseTvRepo.getOnTheAirTvs();
  }
}
