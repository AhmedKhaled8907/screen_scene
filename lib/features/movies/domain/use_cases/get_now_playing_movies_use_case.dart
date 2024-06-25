import 'package:dartz/dartz.dart';
import 'package:movies_app/core/utils/use_cases/base_use_case.dart';
import 'package:movies_app/features/movies/domain/repos/base_movies_repo.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_entity.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<MovieEntity>, NoParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(NoParams params) async {
    return await baseMoviesRepo.getNowPlayingMovies();
  }
}
