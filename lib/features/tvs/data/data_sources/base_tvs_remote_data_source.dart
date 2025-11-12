import '../../domain/entities/similar_tvs_entity.dart';
import '../../domain/use_cases/get_similar_tvs_use_case.dart';
import '../../domain/use_cases/get_tv_details_use_case.dart';
import '../models/tv_details_model.dart';
import '../models/tv_model.dart';

abstract class BaseTvsRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();
  Future<List<TvModel>> getPopularTvs();
  Future<List<TvModel>> getTopRatedTvs();
  Future<TvDetailsModel> getTvDetails(TvDetailsParams params);
  Future<List<SimilarTvsEntity>> getSimilarTvs(
    SimilarTvsParams params,
  );
}
