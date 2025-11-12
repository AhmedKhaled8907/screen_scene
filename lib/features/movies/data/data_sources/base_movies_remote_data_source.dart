import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import '../../domain/entities/similar_movies_entity.dart';
import '../../domain/use_cases/get_movie_details_use_case.dart';
import '../../domain/use_cases/get_similar_movies_use_case.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParams params);
  Future<List<SimilarMoviesEntity>> getSimilarMovies(
      SimilarMoviesParams params);
}
