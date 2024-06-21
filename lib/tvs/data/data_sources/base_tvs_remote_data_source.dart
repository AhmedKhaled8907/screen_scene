import 'package:movies_app/tvs/data/models/tv_model.dart';

abstract class BaseTvsRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();
  Future<List<TvModel>> getPopularTvs();
  Future<List<TvModel>> getTopRatedTvs();
  // Future<TvDetailsModel> getTvDetails(TvDetailsParams params);
  // Future<List<SimilarTvsEntity>> getSimilarTvs(
  //     SimilarTvsParams params);
}
