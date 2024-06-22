import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/utils/network/error_message_model.dart';
import 'package:movies_app/search/data/data_sources/base_search_remote_data_source.dart';
import 'package:movies_app/search/data/models/search_model.dart';
import 'package:movies_app/search/domain/use_cases/get_search_multi_use_case.dart';

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
