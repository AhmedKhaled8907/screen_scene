import 'package:dartz/dartz.dart';
import 'package:screen_scene/core/error/custom_failure.dart';
import 'package:screen_scene/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<CustomFailure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<CustomFailure, UserEntity>> signinUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<CustomFailure, UserEntity>> signInWithGoogle();

  Future<Either<CustomFailure, UserEntity>> signInWithFacebook();

  Future<Either<CustomFailure, UserEntity>> signInWithApple();

  Future<void> addUserData({required UserEntity user});
  Future<void> saveUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uId});

  Future<void> signOut();

  Future<Either<CustomFailure, UserEntity>> getUser();
  Future<void> resetPassword({
    required String email,
  });
}
