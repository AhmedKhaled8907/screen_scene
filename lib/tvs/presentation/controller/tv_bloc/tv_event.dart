part of 'tv_bloc.dart';

sealed class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetOnTheAirTvsEvent extends TvEvent {}

class GetPopularTvsEvent extends TvEvent {}

class GetTopRatedTvsEvent extends TvEvent {}
