import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/global/resources/api_constants_manager.dart';
import 'package:movies_app/core/global/resources/constants_manager.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/tvs/data/data_sources/base_tvs_remote_data_source.dart';
import 'package:movies_app/tvs/data/models/tv_model.dart';

class TvsRemoteDataSource extends BaseTvsRemoteDataSource {
  // get on the air Tvs
  @override
  Future<List<TvModel>> getOnTheAirTvs() async {
    final response = await Dio().get(ApiConstants.onTheAirTvsBaseUrl);
    return getDataResponse(response);
  }

  // get popular Tvs
  @override
  Future<List<TvModel>> getPopularTvs() async {
    final response = await Dio().get(ApiConstants.popularTvBaseUrl);
    return getDataResponse(response);
  }

  // get top rated Tvs
  @override
  Future<List<TvModel>> getTopRatedTvs() async {
    final response = await Dio().get(ApiConstants.topRatedTvBaseUrl);
    return getDataResponse(response);
  }

  // get data response method
  List<TvModel> getDataResponse(Response<dynamic> response) {
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
}
  // // get Tv details
  // @override
  // Future<TvDetailsModel> getTvDetails(TvDetailsParams params) async {
  //   final response = await Dio().get(
  //     ApiConstants.TvDetailsBaseUrl(params.TvId),
  //   );
  //   if (response.statusCode == AppConstants.successCode200) {
  //     return TvDetailsModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }

  // // get similar Tv
  // @override
  // Future<List<SimilarTvsEntity>> getSimilarTvs(
  //     SimilarTvsParams params) async {
  //   final response = await Dio().get(
  //     ApiConstants.similarTvsBaseUrl(params.TvId),
  //   );
  //   if (response.statusCode == AppConstants.successCode200) {
  //     return List<SimilarTvsModel>.from(
  //         (response.data[ApiConstants.listName] as List).map(
  //       (e) => SimilarTvsModel.fromJson(e),
  //     ));
  //   } else {
  //     throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }
