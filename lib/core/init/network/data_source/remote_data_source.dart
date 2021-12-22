import 'package:firebase_auth/firebase_auth.dart';

import '../../../../features/auth/login/services/login_request.dart';
import '../../../../features/auth/signup/services/signup_request.dart';
import '../services/firebase_services.dart';

abstract class RemoteDataSource {
  Future<UserCredential> signUp(SignUpRequest signUpRequest);
  Future<UserCredential> logIn(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseServices _firebaseServices;
  RemoteDataSourceImpl(this._firebaseServices);
  @override
  Future<UserCredential> signUp(SignUpRequest signUpRequest) async {
    return await _firebaseServices.signUp(
        signUpRequest.email, signUpRequest.password);
  }

  @override
  Future<UserCredential> logIn(LoginRequest loginRequest) async {
    return await _firebaseServices.logIn(
        loginRequest.email, loginRequest.password);
  }
}
