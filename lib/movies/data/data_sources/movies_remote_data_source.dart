import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

import '../../../core/network/error_message_model.dart';
import 'base_movies_remote_data_source.dart';

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  // get now playing movies
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstants.nowPlayingBaseUrl);
    // print(response);
    return getDataResponse(response);
  }

  // get popular movies
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstants.popularBaseUrl);
    return getDataResponse(response);
  }

  // get top rated movies
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.topRatedBaseUrl);
    return getDataResponse(response);
  }

  // get data response method
  List<MovieModel> getDataResponse(Response<dynamic> response) {
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
