part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = '',
  });

  final List<MovieEntity> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
      ];
}
