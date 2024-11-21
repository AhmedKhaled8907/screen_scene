import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:screen_scene/core/error/failure.dart';
import 'package:screen_scene/core/utils/use_cases/base_use_case.dart';
import 'package:screen_scene/features/movies/domain/entities/movie_details_entity.dart';
import 'package:screen_scene/features/movies/domain/repos/base_movies_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetailsEntity, MovieDetailsParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
      MovieDetailsParams params) async {
    return await baseMoviesRepo.getMovieDetails(params);
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
