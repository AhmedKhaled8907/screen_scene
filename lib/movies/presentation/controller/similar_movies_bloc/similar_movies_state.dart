// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'similar_movies_bloc.dart';

class SimilarMoviesState extends Equatable {
  const SimilarMoviesState({
    this.similarMovies = const [],
    this.similarMoviesState = RequestState.loading,
    this.similarMoviesMessage = '',
  });

  final List<SimilarMoviesEntity> similarMovies;
  final RequestState similarMoviesState;
  final String similarMoviesMessage;

  @override
  List<Object> get props => [
        similarMovies,
        similarMoviesState,
        similarMoviesMessage,
      ];

  SimilarMoviesState copyWith({
    List<SimilarMoviesEntity>? similarMovies,
    RequestState? similarMoviesState,
    String? similarMoviesMessage,
  }) {
    return SimilarMoviesState(
      similarMovies: similarMovies ?? this.similarMovies,
      similarMoviesState: similarMoviesState ?? this.similarMoviesState,
      similarMoviesMessage: similarMoviesMessage ?? this.similarMoviesMessage,
    );
  }
}
