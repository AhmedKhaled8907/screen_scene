part of 'tv_details_bloc.dart';

sealed class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int id;
  const GetTvDetailsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

