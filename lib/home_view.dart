import 'package:flutter/material.dart';
import 'package:movies_app/core/global/resources/colors_manager.dart';
import 'package:movies_app/core/global/resources/values_manager.dart';
import 'package:movies_app/movies/presentation/views/movie_view/movies_view.dart';
import 'package:movies_app/search/presentation/views/search_view.dart';
import 'package:movies_app/tvs/presentation/views/tv_view/tvs_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TVs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
