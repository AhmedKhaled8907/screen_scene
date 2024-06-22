import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/search/domain/entities/search_entity.dart';
import 'package:movies_app/search/domain/use_cases/get_search_multi_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetMultiSearchUseCase getMultiSearchUseCase;

  SearchBloc(this.getMultiSearchUseCase) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearSearchResults>(_onClearSearchResults);
  }

  void _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());

    final result = await getMultiSearchUseCase(SearchMultiParams(
      query: event.query,
    ));
    result.fold(
      (failure) => emit(
        SearchError(failure.message),
      ),
      (result) => emit(SearchSuccess(result)),
    );
  }

  void _onClearSearchResults(
    ClearSearchResults event,
    Emitter<SearchState> emit,
  ) {
    emit(SearchInitial());
  }
}
