import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBlocBloc extends Bloc<MovieEvent, MovieState> {
  MovieBlocBloc() : super(const MovieState()) {
    on<MovieEvent>((event, emit) {
      
    });
  }
}
