import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

import '../entities/movie_entity.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedMoviesUseCase(this.baseMoviesRepo);

  Future<List<MovieEntity>> execute() async {
    return await baseMoviesRepo.getTopRatedMovies();
  }
}
