import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/response_error/response_error.dart';

abstract class AuthRepository {
  Future<Either<ResponseError, User>>signInWithGoogle();
}