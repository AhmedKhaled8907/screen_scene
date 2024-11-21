import 'package:dartz/dartz.dart';
import 'package:screen_scene/core/error/failure.dart';
import 'package:screen_scene/core/utils/use_cases/base_use_case.dart';
import 'package:screen_scene/features/tvs/domain/entities/tv_entity.dart';
import 'package:screen_scene/features/tvs/domain/repos/base_tv_repo.dart';

class GetPopularTvsUseCase extends BaseUseCase<List<TvEntity>, NoParams> {
  final BaseTvsRepo baseTvsRepo;

  GetPopularTvsUseCase(this.baseTvsRepo);

  @override
  Future<Either<Failure, List<TvEntity>>> call(NoParams params) async {
    return await baseTvsRepo.getPopularTvs();
  }
}
