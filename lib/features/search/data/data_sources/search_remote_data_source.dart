import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/utils/network/error_message_model.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/search/data/data_sources/base_search_remote_data_source.dart';
import 'package:movies_app/features/search/domain/use_cases/get_search_movies_use_case.dart';

import '../../../tvs/data/models/tv_model.dart';
import '../../domain/use_cases/get_search_tvs_use_case.dart';

class SearchRemoteDataSource extends BaseSearchRemoteDataSource {
  @override
  Future<List<MovieModel>> getMoviesSearch(SearchMoviesParams params) async {
    final response = await Dio().get(
      ApiConstants.searchMoviesBaseUrl(
        params.query,
      ),
    );
    return getMovieDataResponse(response);
  }

  @override
  Future<List<TvModel>> getTvsSearch(SearchTvsParams params) async {
    final response = await Dio().get(
      ApiConstants.searchTvsBaseUrl(
        params.query,
      ),
    );
    return getTvDataResponse(response);
  }

  // get data response method for tvs
  List<TvModel> getTvDataResponse(Response<dynamic> response) {
    if (response.statusCode == AppConstants.successCode200) {
      return List<TvModel>.from(
          (response.data[ApiConstants.listName] as List).map(
        (e) => TvModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  // get data response method for movies
  List<MovieModel> getMovieDataResponse(Response<dynamic> response) {
    if (response.statusCode == AppConstants.successCode200) {
      return List<MovieModel>.from(
          (response.data[ApiConstants.listName] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
