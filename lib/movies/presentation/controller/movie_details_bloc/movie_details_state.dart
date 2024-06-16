// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  final MovieDetailsEntity? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  // final List<MovieEntity> similarMovies;
  // final RequestState similarMoviesState;
  // final String similarMoviesMessage;

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        // similarMovies,
        // similarMoviesState,
        // similarMoviesMessage
      ];

  MovieDetailsState copyWith({
    MovieDetailsEntity? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
    );
  }
}
