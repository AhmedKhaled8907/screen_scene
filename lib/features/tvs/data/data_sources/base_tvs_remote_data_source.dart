import 'package:screen_scene/features/tvs/data/models/tv_details_model.dart';
import 'package:screen_scene/features/tvs/data/models/tv_model.dart';
import 'package:screen_scene/features/tvs/domain/entities/similar_tvs_entity.dart';
import 'package:screen_scene/features/tvs/domain/use_cases/get_similar_tvs_use_case.dart';
import 'package:screen_scene/features/tvs/domain/use_cases/get_tv_details_use_case.dart';

abstract class BaseTvsRemoteDataSource {
  Future<List<TvModel>> getOnTheAirTvs();
  Future<List<TvModel>> getPopularTvs();
  Future<List<TvModel>> getTopRatedTvs();
  Future<TvDetailsModel> getTvDetails(TvDetailsParams params);
  Future<List<SimilarTvsEntity>> getSimilarTvs(
    SimilarTvsParams params,
  );
}
