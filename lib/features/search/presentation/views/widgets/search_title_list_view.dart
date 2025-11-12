import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/global/resources/colors_manager.dart';
import '../../../../../core/global/resources/strings_manager.dart';
import '../../../../../core/global/resources/styles_manager.dart';
import '../../../../../core/global/resources/values_manager.dart';
import '../../../../../core/global/theme/theme_bloc/theme_bloc.dart';

class SearchTitleListView extends StatefulWidget {
  final Function(int) onSearchTypeChanged;

  const SearchTitleListView({super.key, required this.onSearchTypeChanged});

  @override
  SearchTitleListViewState createState() => SearchTitleListViewState();
}

class SearchTitleListViewState extends State<SearchTitleListView> {
  int _selectedIndex = 0;

  final List<String> items = [
    AppString.moviesNav,
    AppString.tvsNav,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onSearchTypeChanged(_selectedIndex);
          },
          child: BlocBuilder<ThemeBloc, ThemeState>(
            buildWhen: (previous, current) =>
                previous.isDarkMode != current.isDarkMode,
            builder: (context, state) {
              bool isDarkMode = state.isDarkMode;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: isDarkMode ? AppColors.grey : Colors.black,
                  ),
                  color: _selectedIndex == index
                      ? AppColors.gold
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m8,
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: getSemiBoldStyle(fontSize: 16.0).copyWith(
                      color: isDarkMode
                          ? _selectedIndex == index
                              ? AppColors.black
                              : AppColors.white
                          : _selectedIndex == index
                              ? AppColors.black
                              : AppColors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
