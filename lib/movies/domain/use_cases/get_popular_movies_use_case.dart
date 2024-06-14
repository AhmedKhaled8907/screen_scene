import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

import '../entities/movie_entity.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMoviesUseCase(this.baseMoviesRepo);

  Future<List<MovieEntity>> execute() async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
