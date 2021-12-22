import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../features/auth/login/services/login_request.dart';
import '../../../../features/auth/signup/services/signup_request.dart';
import '../failure/failure.dart';

abstract class Repository {
  Future<Either<Failure,UserCredential>> signUp(SignUpRequest signUpRequest);
  Future<Either<Failure,UserCredential>> logIn(LoginRequest loginRequest);
}
