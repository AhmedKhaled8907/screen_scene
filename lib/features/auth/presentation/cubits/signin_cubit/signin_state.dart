part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}

final class SignoutSuccess extends SigninState {
  SignoutSuccess();
}

final class ResetPasswordSuccess extends SigninState {
  ResetPasswordSuccess();
}

final class SigninFailure extends SigninState {
  final String message;

  SigninFailure({required this.message});
}
