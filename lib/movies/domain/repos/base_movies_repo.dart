import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
}
