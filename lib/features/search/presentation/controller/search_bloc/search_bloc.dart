import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/features/movies/domain/entities/movie_entity.dart';
import 'package:screen_scene/features/search/domain/use_cases/get_search_movies_use_case.dart';

import '../../../../tvs/domain/entities/tv_entity.dart';
import '../../../domain/use_cases/get_search_tvs_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMoviesUseCase getSearchMoviesUseCase;
  final GetSearchTvsUseCase getSearchTvsUseCase;

  SearchBloc(
    this.getSearchMoviesUseCase,
    this.getSearchTvsUseCase,
  ) : super(SearchInitial()) {
    on<SearchMoviesQueryChanged>(_onSearchMoviesQueryChanged);
    on<SearchTvsQueryChanged>(_onSearchTvQueryChanged);
    on<ClearSearchResults>(_onClearSearchResults);
  }

  void _onSearchMoviesQueryChanged(
    SearchMoviesQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());

    final result = await getSearchMoviesUseCase(SearchMoviesParams(
      query: event.query,
    ));
    result.fold(
      (failure) => emit(
        SearchMoviesError(failure.message),
      ),
      (result) => emit(SearchMoviesSuccess(result)),
    );
  }

  void _onSearchTvQueryChanged(
    SearchTvsQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());

    final result = await getSearchTvsUseCase(SearchTvsParams(
      query: event.query,
    ));
    result.fold(
      (failure) => emit(
        SearchTvsError(failure.message),
      ),
      (result) => emit(SearchTvsSuccess(result)),
    );
  }

  void _onClearSearchResults(
    ClearSearchResults event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchInitial());
  }
}
