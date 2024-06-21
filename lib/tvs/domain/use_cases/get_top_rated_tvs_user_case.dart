import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_cases/base_use_case.dart';
import 'package:movies_app/tvs/domain/entities/tv_entity.dart';
import 'package:movies_app/tvs/domain/repos/base_tv_repo.dart';




class GetTopRatedTvsUseCase
    extends BaseUseCase<List<TvEntity>, NoParams> {
  final BaseTvsRepo baseTvsRepo;

  GetTopRatedTvsUseCase(this.baseTvsRepo);

  @override
  Future<Either<Failure, List<TvEntity>>> call(NoParams params) async {
    return await baseTvsRepo.getTopRatedTvs();
  }
}
