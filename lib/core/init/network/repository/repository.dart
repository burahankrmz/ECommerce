import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/init/network/failure/failure.dart';
import 'package:ecommerce/features/auth/signup/services/signup_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Repository {
  Future<Either<Failure,UserCredential>> signUp(SignUpRequest signUpRequest);
}
