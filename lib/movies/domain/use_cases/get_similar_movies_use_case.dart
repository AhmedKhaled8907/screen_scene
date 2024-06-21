import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/utils/use_cases/base_use_case.dart';
import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

import '../entities/similar_movies_entity.dart';

class GetSimilarMoviesUseCase
    extends BaseUseCase<List<SimilarMoviesEntity>, SimilarMoviesParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetSimilarMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<SimilarMoviesEntity>>> call(
      SimilarMoviesParams params) async {
    return await baseMoviesRepo.getSimilarMovies(params);
  }
}

class SimilarMoviesParams extends Equatable {
  final int movieId;

  const SimilarMoviesParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
