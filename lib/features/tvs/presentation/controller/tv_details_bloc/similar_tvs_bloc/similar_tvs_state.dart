part of 'similar_tvs_bloc.dart';

class SimilarTvsState extends Equatable {
  const SimilarTvsState({
    this.similarTvs = const [],
    this.similarTvsState = RequestState.loading,
    this.similarTvsMessage = '',
  });

  final List<SimilarTvsEntity> similarTvs;
  final RequestState similarTvsState;
  final String similarTvsMessage;

  @override
  List<Object> get props => [
        similarTvs,
        similarTvsState,
        similarTvsMessage,
      ];

  SimilarTvsState copyWith({
    List<SimilarTvsEntity>? similarTvs,
    RequestState? similarTvsState,
    String? similarTvsMessage,
  }) {
    return SimilarTvsState(
      similarTvs: similarTvs ?? this.similarTvs,
      similarTvsState: similarTvsState ?? this.similarTvsState,
      similarTvsMessage: similarTvsMessage ?? this.similarTvsMessage,
    );
  }
}
