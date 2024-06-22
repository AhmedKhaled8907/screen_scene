import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/search/domain/use_cases/get_search_movies_use_case.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<MovieModel>> getMoviesSearch(SearchMoviesParams params);
  // Future<List<SearchModel>> getPopularSearch();
  // Future<List<SearchModel>> getTopRatedSearch();
}
