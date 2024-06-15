import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';

class MoviesRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
      '${AppConstants.baseUrl}/movie/popular?api_key=${AppConstants.apiKey}',
    );

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }
}
