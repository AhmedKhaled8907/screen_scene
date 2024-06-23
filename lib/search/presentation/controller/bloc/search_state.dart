part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

// Movies Search States
class SearchMoviesSuccess extends SearchState {
  final List<MovieEntity> results;

  const SearchMoviesSuccess(this.results);

  @override
  List<Object> get props => [results];
}

class SearchMoviesError extends SearchState {
  final String message;

  const SearchMoviesError(this.message);

  @override
  List<Object> get props => [message];
}

// TVs Search States
class SearchTvsSuccess extends SearchState {
  final List<TvEntity> results;

  const SearchTvsSuccess(this.results);

  @override
  List<Object> get props => [results];
}

class SearchTvsError extends SearchState {
  final String message;

  const SearchTvsError(this.message);

  @override
  List<Object> get props => [message];
}

// // Persons Search States
// class SearchPersonsSuccess extends SearchState {
//   final List<PersonEntity> results;

//   const SearchPersonsSuccess(this.results);

//   @override
//   List<Object> get props => [results];
// }

// class SearchPersonsError extends SearchState {
//   final String message;

//   const SearchPersonsError(this.message);

//   @override
//   List<Object> get props => [message];
// }
