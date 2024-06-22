import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/utils/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/search/data/data_sources/base_search_remote_data_source.dart';
import 'package:movies_app/search/domain/use_cases/get_search_movies_use_case.dart';

class SearchRemoteDataSource extends BaseSearchRemoteDataSource {
  @override
  Future<List<MovieModel>> getMoviesSearch(SearchMoviesParams params) async {
    final response = await Dio().get(
      ApiConstants.multiSearchBaseUrl(
        params.query,
      ),
    );
    return getDataResponse(response);
  }

  // get data response method
  List<MovieModel> getDataResponse(Response<dynamic> response) {
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
