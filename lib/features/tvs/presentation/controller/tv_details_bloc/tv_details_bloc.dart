import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/tvs/domain/entities/tv_details_entity.dart';

import 'package:movies_app/features/tvs/domain/use_cases/get_tv_details_use_case.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvDetailsUseCase getTvDetailsUseCase;
  TvDetailsBloc(this.getTvDetailsUseCase) : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetailsEvent);
  }

  FutureOr<void> _getTvDetailsEvent(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getTvDetailsUseCase(
      TvDetailsParams(id: event.id),
    );
    result.fold(
      (l) => emit(
        TvDetailsState(
          tvDetailsState: RequestState.error,
          tvDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        TvDetailsState(
          tvDetails: r,
          tvDetailsState: RequestState.loaded,
        ),
      ),
    );
  }
}
