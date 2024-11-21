import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scene/features/auth/domain/entities/user_entity.dart';
import 'package:screen_scene/features/auth/domain/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());

    var result = await authRepo.signinUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (user) => emit(
        SigninSuccess(userEntity: user),
      ),
    );
  }

  Future<void> signinUserWithGoogle() async {
    emit(SigninLoading());

    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (user) => emit(
        SigninSuccess(userEntity: user),
      ),
    );
  }

  Future<void> signinUserWithFacebook() async {
    emit(SigninLoading());

    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (user) => emit(
        SigninSuccess(userEntity: user),
      ),
    );
  }

  Future<void> signinUserWithApple() async {
    emit(SigninLoading());

    var result = await authRepo.signInWithApple();
    result.fold(
      (failure) => emit(
        SigninFailure(message: failure.message),
      ),
      (user) => emit(
        SigninSuccess(userEntity: user),
      ),
    );
  }

  Future<void> signOut() async {
    emit(SigninLoading());
    await authRepo.signOut();
    emit(SignoutSuccess());
  }
}
