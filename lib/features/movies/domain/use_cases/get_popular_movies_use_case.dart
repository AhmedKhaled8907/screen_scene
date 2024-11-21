import 'package:dartz/dartz.dart';
import 'package:screen_scene/core/utils/use_cases/base_use_case.dart';
import 'package:screen_scene/features/movies/domain/repos/base_movies_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntity>,NoParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
