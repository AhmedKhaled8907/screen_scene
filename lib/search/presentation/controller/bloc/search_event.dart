part of 'search_bloc.dart';



abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchQueryChanged extends SearchEvent {
  final String query;

  const SearchQueryChanged({required this.query});

  @override
  List<Object> get props => [query];
}

class ClearSearchResults extends SearchEvent {}
