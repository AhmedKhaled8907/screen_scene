import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Dio _dio;

  SearchBloc() : _dio = Dio(), super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClearSearchResults>(_onClearSearchResults);
  }

  void _onSearchQueryChanged(SearchQueryChanged event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/search/multi',
        queryParameters: {
          'api_key': '61854a9ecbed259f4938884b530d31a9',
          'query': event.query,
        },
      );
      final results = response.data['results'];
      emit(SearchLoaded(results));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void _onClearSearchResults(ClearSearchResults event, Emitter<SearchState> emit) {
    emit(SearchInitial());
  }
}