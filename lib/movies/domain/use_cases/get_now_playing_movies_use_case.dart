import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

import '../entities/movie_entity.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepo);

  Future<List<MovieEntity>> execute() async {
    return await baseMoviesRepo.getNowPlayingMovies();
  }
}
