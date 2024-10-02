import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal/features/auth/services/auth_service.dart';
import 'package:royal/utils/response_error/response_error.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);

  final AuthService _authService;


  @override
   Future<Either<ResponseError, User>> signInWithGoogle() async {
    final result = await _authService.signInWithGoogle();
    return result.fold(
          (failure) => Left(failure),
          (userCredential) => Right(userCredential.user!),
    );
  }}