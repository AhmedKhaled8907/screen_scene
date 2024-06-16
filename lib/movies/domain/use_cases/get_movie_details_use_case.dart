// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_cases/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/repos/base_movies_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<List<MovieDetailsEntity>, MovieDetailsParams> {
  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure, List<MovieDetailsEntity>>> call(
      MovieDetailsParams params) async {
    return await baseMoviesRepo.getMovieDetails();
  }
}

class MovieDetailsParams extends Equatable {
  final int movieId;

  const MovieDetailsParams({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
