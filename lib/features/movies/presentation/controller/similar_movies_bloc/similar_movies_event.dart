part of 'similar_movies_bloc.dart';

sealed class SimilarMoviesEvent extends Equatable {
  const SimilarMoviesEvent();
}

class GetSimilarMoviesEvent extends SimilarMoviesEvent {
  final int movieId;
  const GetSimilarMoviesEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
