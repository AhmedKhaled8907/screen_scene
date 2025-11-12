import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_cases/base_use_case.dart';
import '../entities/movie_entity.dart';
import '../repos/base_movies_repo.dart';

class GetTopRatedMoviesUseCase
    extends BaseUseCase<List<MovieEntity>, NoParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await baseMoviesRepo.getTopRatedMovies();
  }
}
