import 'package:dio/dio.dart';
import 'package:screen_scene/core/error/exceptions.dart';
import 'package:screen_scene/core/global/resources/api_constants_manager.dart';
import 'package:screen_scene/core/global/resources/constants_manager.dart';
import 'package:screen_scene/features/movies/data/models/movie_details_model.dart';
import 'package:screen_scene/features/movies/data/models/movie_model.dart';
import 'package:screen_scene/features/movies/data/models/similar_movies_model.dart';
import 'package:screen_scene/features/movies/domain/entities/similar_movies_entity.dart';
import 'package:screen_scene/features/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:screen_scene/features/movies/domain/use_cases/get_similar_movies_use_case.dart';

import '../../../../core/utils/network/error_message_model.dart';
import 'base_movies_remote_data_source.dart';

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  // get now playing movies
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesBaseUrl);
    return getDataResponse(response);
  }

  // get popular movies
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesBaseUrl);
    return getDataResponse(response);
  }

  // get top rated movies
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedMoviesBaseUrl);
    return getDataResponse(response);
  }

  // get movie details
  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParams params) async {
    final response = await Dio().get(
      ApiConstants.movieDetailsBaseUrl(params.movieId),
    );
    if (response.statusCode == AppConstants.successCode200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  // get similar movie
  @override
  Future<List<SimilarMoviesEntity>> getSimilarMovies(
      SimilarMoviesParams params) async {
    final response = await Dio().get(
      ApiConstants.similarMoviesBaseUrl(params.movieId),
    );
    if (response.statusCode == AppConstants.successCode200) {
      return List<SimilarMoviesModel>.from(
          (response.data[ApiConstants.listName] as List).map(
        (e) => SimilarMoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
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
