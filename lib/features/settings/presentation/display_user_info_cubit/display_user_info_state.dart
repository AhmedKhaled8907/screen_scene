part of 'display_user_info_cubit.dart';

@immutable
sealed class DisplayUserInfoState {}

final class DisplayUserInfoInitial extends DisplayUserInfoState {}

final class DisplayUserInfoLoading extends DisplayUserInfoState {}

final class DisplayUserInfoSuccess extends DisplayUserInfoState {
  final UserEntity entity;

  DisplayUserInfoSuccess({required this.entity});
}

final class DisplayUserInfoFailure extends DisplayUserInfoState {
  final String errMessage;

  DisplayUserInfoFailure({required this.errMessage});
}
