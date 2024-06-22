import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/styles_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/search/presentation/controller/bloc/search_bloc.dart';
import 'package:movies_app/search/presentation/views/widgets/search_results.dart';

import '../../../core/global/resources/font_manager.dart';
import 'widgets/search_bar_items.dart';
import 'widgets/search_results_item.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  SearchViewBodyState createState() => SearchViewBodyState();
}

class SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _controller = TextEditingController();
  bool _showNoDataMessage = false;
  String _lastQuery = '';
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final query = _controller.text;
    if (query.isEmpty) {
      context.read<SearchBloc>().add(ClearSearchResults());
    } else {
      if (query != _lastQuery) {
        _lastQuery = query;
        context.read<SearchBloc>().add(SearchQueryChanged(query: query));
        _startLoadingTimeout();
      }
    }
  }

  void _clearSearch() {
    _controller.clear();
    _focusNode.unfocus();
    context.read<SearchBloc>().add(ClearSearchResults());
  }

  void _startLoadingTimeout() {
    final currentQuery = _lastQuery;

    setState(() {
      _showNoDataMessage = false;
    });

    Future.delayed(const Duration(seconds: AppDuration.d3), () {
      if (mounted && _lastQuery == currentQuery) {
        final state = context.read<SearchBloc>().state;
        if (state is SearchLoading) {
          setState(() {
            _showNoDataMessage = true;
          });
        } else if (state is SearchSuccess && state.results.isEmpty) {
          setState(() {
            _showNoDataMessage = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBarItems(
            controller: _controller,
            clearSearch: _clearSearch,
            focusNode: _focusNode,
          ),
          const SizedBox(height: AppSize.s8),
          const SizedBox(
            height: AppSize.s50,
            child: SearchTitleListView(),
          ),
          const SizedBox(height: AppSize.s16),
          const Divider(
            height: AppSize.s1,
            thickness: AppSize.s1,
          ),
          Expanded(
            child: _showNoDataMessage
                ? Center(
                    child: Text(
                      AppString.noResultsFound,
                      style: getMediumStyle(fontSize: FontSize.s16),
                    ),
                  )
                : const SearchResults(),
          ),
        ],
      ),
    );
  }
}
