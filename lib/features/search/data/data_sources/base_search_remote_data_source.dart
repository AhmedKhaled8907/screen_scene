import '../../../movies/data/models/movie_model.dart';
import '../../../tvs/domain/entities/tv_entity.dart';
import '../../domain/use_cases/get_search_movies_use_case.dart';
import '../../domain/use_cases/get_search_tvs_use_case.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<MovieModel>> getMoviesSearch(SearchMoviesParams params);
  Future<List<TvEntity>> getTvsSearch(SearchTvsParams params);
  // Future<List<SearchModel>> getTopRatedSearch();
}
