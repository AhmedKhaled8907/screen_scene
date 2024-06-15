
import 'package:flutter/material.dart';
import 'package:movies_app/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repos/movies_repo.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_use_case.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  void getData() async {
    final remoteDataSource = MoviesRemoteDataSource();
    final baseMoviesRepo = MoviesRepo(remoteDataSource);
    final result = await GetNowPlayingMoviesUseCase(baseMoviesRepo).execute();
    print(result);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
