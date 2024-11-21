import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:screen_scene/core/error/failure.dart';
import 'package:screen_scene/core/utils/use_cases/base_use_case.dart';
import 'package:screen_scene/features/tvs/domain/entities/tv_details_entity.dart';
import 'package:screen_scene/features/tvs/domain/repos/base_tv_repo.dart';

class GetTvDetailsUseCase
    extends BaseUseCase<TvDetailsEntity, TvDetailsParams> {
  final BaseTvsRepo baseTvsRepo;

  GetTvDetailsUseCase(this.baseTvsRepo);

  @override
  Future<Either<Failure, TvDetailsEntity>> call(TvDetailsParams params) async {
    return await baseTvsRepo.getTvDetails(params);
  }
}

class TvDetailsParams extends Equatable {
  final int id;

  const TvDetailsParams({required this.id});

  @override
  List<Object> get props => [id];
}
