import 'package:movies_app/movies/domain/entities/movie_entity.dart';

abstract class BaseMoviesRepo {
  Future<List<MovieEntity>> getNowPlaying();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
}
