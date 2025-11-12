import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_details_entity.dart';
import '../entities/movie_entity.dart';
import '../entities/similar_movies_entity.dart';
import '../use_cases/get_movie_details_use_case.dart';
import '../use_cases/get_similar_movies_use_case.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
    MovieDetailsParams params,
  );
  Future<Either<Failure, List<SimilarMoviesEntity>>> getSimilarMovies(
    SimilarMoviesParams params,
  );
}
