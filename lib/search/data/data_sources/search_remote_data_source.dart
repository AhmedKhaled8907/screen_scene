import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/utils/network/error_message_model.dart';
import 'package:movies_app/search/data/models/search_model.dart';
import 'package:movies_app/search/domain/use_cases/get_search_multi_use_case.dart';

import 'base_Search_remote_data_source.dart';

class SearchRemoteDataSource extends BaseSearchRemoteDataSource {
  @override
  Future<List<SearchModel>> getMultiSearch(SearchMultiParams params) async {
    final response = await Dio().get(
      ApiConstants.multiSearchBaseUrl(
        params.query,
      ),
    );
    return getDataResponse(response);
  }

  // // get now playing Search
  // @override
  // Future<List<SearchModel>> getNowPlayingSearch() async {
  //   final response = await Dio().get(ApiConstants.nowPlayingSearchBaseUrl);
  //   return getDataResponse(response);
  // }

  // // get popular Search
  // @override
  // Future<List<SearchModel>> getPopularSearch() async {
  //   final response = await Dio().get(ApiConstants.popularSearchBaseUrl);
  //   return getDataResponse(response);
  // }

  // // get top rated Search
  // @override
  // Future<List<SearchModel>> getTopRatedSearch() async {
  //   final response = await Dio().get(ApiConstants.topRatedSearchBaseUrl);
  //   return getDataResponse(response);
  // }

  // // get Search details
  // @override
  // Future<SearchDetailsModel> getSearchDetails(SearchDetailsParams params) async {
  //   final response = await Dio().get(
  //     ApiConstants.SearchDetailsBaseUrl(params.SearchId),
  //   );
  //   if (response.statusCode == AppConstants.successCode200) {
  //     return SearchDetailsModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }

  // // get similar Search
  // @override
  // Future<List<SimilarSearchEntity>> getSimilarSearch(
  //     SimilarSearchParams params) async {
  //   final response = await Dio().get(
  //     ApiConstants.similarSearchBaseUrl(params.SearchId),
  //   );
  //   if (response.statusCode == AppConstants.successCode200) {
  //     return List<SimilarSearchModel>.from(
  //         (response.data[ApiConstants.listName] as List).map(
  //       (e) => SimilarSearchModel.fromJson(e),
  //     ));
  //   } else {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }

  // get data response method
  List<SearchModel> getDataResponse(Response<dynamic> response) {
    if (response.statusCode == AppConstants.successCode200) {
      return List<SearchModel>.from(
          (response.data[ApiConstants.listName] as List).map(
        (e) => SearchModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
