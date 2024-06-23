import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/strings_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/movies/presentation/views/movie_view/movies_view.dart';
import 'package:movies_app/search/presentation/views/search_view.dart';
import 'package:movies_app/tvs/presentation/views/tv_view/tvs_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;

  List<Widget> viewsList = [
    const MoviesView(),
    const TvsView(),
    const SearchView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewsList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.grey.withOpacity(AppSize.s0_75),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: AppString.moviesNav,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: AppString.tvsNav,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: AppString.searchNav,
          ),
        ],
      ),
    );
  }
}
