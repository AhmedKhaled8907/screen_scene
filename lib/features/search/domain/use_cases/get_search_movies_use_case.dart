import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/use_cases/base_use_case.dart';
import '../../../movies/domain/entities/movie_entity.dart';
import '../repos/base_search_repo.dart';

class GetSearchMoviesUseCase
    extends BaseUseCase<List<MovieEntity>, SearchMoviesParams> {
  final BaseSearchRepo baseSearchRepo;

  GetSearchMoviesUseCase(this.baseSearchRepo);

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
