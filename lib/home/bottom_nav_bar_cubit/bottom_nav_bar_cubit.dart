import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/views/movie_view/movies_view.dart';

import '../../core/global/resources/strings_manager.dart';
import '../../search/presentation/views/search_view.dart';
import '../../settings/presentation/views/settings_view.dart';
import '../../tvs/presentation/views/tv_view/tvs_view.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarInitial(MoviesView()));
  static BottomNavBarCubit get(BuildContext context) =>
      BlocProvider.of(context);
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  
  List<Widget> views = [
    const MoviesView(),
    const TvsView(),
    const SearchView(),
    const SettingsView(),
  ];

  List<BottomNavigationBarItem> get navBarItems => [
        const BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: AppString.moviesNav,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.tv),
          label: AppString.tvsNav,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppString.searchNav,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: AppString.settingsNav,
        ),
      ];

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    emit(ChangeCurrentIndexState(views[_currentIndex]));
  }
}
