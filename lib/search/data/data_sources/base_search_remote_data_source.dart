

import 'package:movies_app/search/data/models/search_model.dart';
import 'package:movies_app/search/domain/use_cases/get_search_multi_use_case.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<SearchModel>> getMultiSearch(SearchMultiParams params);
  // Future<List<SearchModel>> getPopularSearch();
  // Future<List<SearchModel>> getTopRatedSearch();

}
