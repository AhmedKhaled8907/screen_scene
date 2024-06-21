part of 'similar_tvs_bloc.dart';

sealed class SimilarTvsEvent extends Equatable {
  const SimilarTvsEvent();
}

class GetSimilarTvsEvent extends SimilarTvsEvent {
  final int id;
  const GetSimilarTvsEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
