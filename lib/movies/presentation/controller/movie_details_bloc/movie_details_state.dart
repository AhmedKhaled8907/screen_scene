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

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
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
