import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

import '../entities/movie_entity.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedMoviesUseCase(this.baseMoviesRepo);

  Future<Either<Failure, List<MovieEntity>>> execute() async {
    return await baseMoviesRepo.getTopRatedMovies();
  }
}
