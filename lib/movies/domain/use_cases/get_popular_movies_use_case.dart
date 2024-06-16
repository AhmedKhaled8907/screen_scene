import 'package:dartz/dartz.dart';
import 'package:movies_app/core/use_cases/base_use_case.dart';
import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<MovieEntity>> {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
