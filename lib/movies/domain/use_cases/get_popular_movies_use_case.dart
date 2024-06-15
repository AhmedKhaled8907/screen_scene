import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
