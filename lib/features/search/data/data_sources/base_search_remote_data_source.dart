import 'package:screen_scene/features/movies/data/models/movie_model.dart';
import 'package:screen_scene/features/search/domain/use_cases/get_search_movies_use_case.dart';
import 'package:screen_scene/features/search/domain/use_cases/get_search_tvs_use_case.dart';
import 'package:screen_scene/features/tvs/domain/entities/tv_entity.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<MovieModel>> getMoviesSearch(SearchMoviesParams params);
  Future<List<TvEntity>> getTvsSearch(SearchTvsParams params);
  // Future<List<SearchModel>> getTopRatedSearch();
}
