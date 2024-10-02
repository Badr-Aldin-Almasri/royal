import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royal/utils/response_error/response_error.dart';

abstract class AuthService {
  Future<Either<ResponseError, UserCredential>>  signInWithGoogle();
}