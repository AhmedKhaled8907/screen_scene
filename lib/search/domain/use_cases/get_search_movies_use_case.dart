import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/utils/use_cases/base_use_case.dart';
import 'package:movies_app/search/domain/repos/base_search_repo.dart';

import '../../../movies/domain/entities/movie_entity.dart';

class GetMultiSearchUseCase
    extends BaseUseCase<List<MovieEntity>, SearchMoviesParams> {
  final BaseSearchRepo baseSearchRepo;

  GetMultiSearchUseCase(this.baseSearchRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(
    SearchMoviesParams params,
  ) async {
    return await baseSearchRepo.getMoviesSearch(params);
  }
}

class SearchMoviesParams extends Equatable {
  final String query;

  const SearchMoviesParams({required this.query});

  @override
  List<Object> get props => [query];
}
