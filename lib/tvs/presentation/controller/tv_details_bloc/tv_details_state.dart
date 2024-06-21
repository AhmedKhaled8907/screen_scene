part of 'tv_details_bloc.dart';

class TvDetailsState extends Equatable {
  const TvDetailsState({
    this.tvDetails,
    this.tvDetailsState = RequestState.loading,
    this.tvDetailsMessage = '',
  });

  final TvDetailsEntity? tvDetails;
  final RequestState tvDetailsState;
  final String tvDetailsMessage;

  @override
  List<Object?> get props => [
        tvDetails,
        tvDetailsState,
        tvDetailsMessage,
      ];

  TvDetailsState copyWith({
    TvDetailsEntity? tvDetails,
    RequestState? tvDetailsState,
    String? tvDetailsMessage,
  }) {
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
    );
  }
}
