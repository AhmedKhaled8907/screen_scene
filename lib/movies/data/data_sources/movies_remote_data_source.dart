import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/similar_movies_model.dart';
import 'package:movies_app/movies/domain/entities/similar_movies_entity.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_similar_movies_use_case.dart';

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

  // get movie details
  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParams params) async {
    final response =
        await Dio().get(AppConstants.movieDetailsBaseUrl(params.movieId));
    if (response.statusCode == 200) {
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
    final response =
        await Dio().get(AppConstants.similarMoviesBaseUrl(params.movieId));
    if (response.statusCode == 200) {
      return List<SimilarMoviesModel>.from(
          (response.data['results'] as List).map(
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
