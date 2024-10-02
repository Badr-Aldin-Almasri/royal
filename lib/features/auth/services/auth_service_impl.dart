import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:royal/utils/response_error/response_error.dart';

import 'auth_service.dart';

class AuthServiceImpl implements AuthService {


  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthServiceImpl({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) :
        _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<Either<ResponseError, UserCredential>>  signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return Left(ResponseError(errorStatus: 'Google sign in was aborted'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      return Right(userCredential);
    } catch (e) {
      return Left(ResponseError(errorStatus: e.toString()));
    }
  }
}