part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchMoviesQueryChanged extends SearchEvent {
  final String query;

  const SearchMoviesQueryChanged({required this.query});

  @override
  List<Object> get props => [query];
}
class SearchTvsQueryChanged extends SearchEvent {
  final String query;

  const SearchTvsQueryChanged({required this.query});

  @override
  List<Object> get props => [query];
}

class ClearSearchResults extends SearchEvent {}
