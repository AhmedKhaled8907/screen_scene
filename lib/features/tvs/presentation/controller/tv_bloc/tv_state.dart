part of 'tv_bloc.dart';

class TvState extends Equatable {
  const TvState({
    this.onTheAirTvs = const [],
    this.onTheAirState = RequestState.loading,
    this.onTheAirMessage = '',
    this.popularTvs = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTvs = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  final List<TvEntity> onTheAirTvs;
  final RequestState onTheAirState;
  final String onTheAirMessage;
  final List<TvEntity> popularTvs;
  final RequestState popularState;
  final String popularMessage;
  final List<TvEntity> topRatedTvs;
  final RequestState topRatedState;
  final String topRatedMessage;

  @override
  List<Object> get props => [
        onTheAirTvs,
        onTheAirState,
        onTheAirMessage,
        popularTvs,
        popularState,
        popularMessage,
        topRatedTvs,
        topRatedState,
        topRatedMessage,
      ];

  TvState copyWith({
    List<TvEntity>? onTheAirTvs,
    RequestState? onTheAirState,
    String? onTheAirMessage,
    List<TvEntity>? popularTvs,
    RequestState? popularState,
    String? popularMessage,
    List<TvEntity>? topRatedTvs,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return TvState(
      onTheAirTvs: onTheAirTvs ?? this.onTheAirTvs,
      onTheAirState: onTheAirState ?? this.onTheAirState,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      popularTvs: popularTvs ?? this.popularTvs,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTvs: topRatedTvs ?? this.topRatedTvs,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
}
