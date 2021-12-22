import 'package:cloud_firestore/cloud_firestore.dart';
import '../core/init/network/data_source/remote_data_source.dart';
import '../core/init/network/error_handler/error_handler.dart';
import '../core/init/network/failure/failure.dart';
import 'package:dartz/dartz.dart';
import '../core/init/network/networkinfo/network_info.dart';
import '../core/init/network/repository/repository.dart';
import '../features/auth/login/services/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../features/auth/signup/services/signup_request.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final FirebaseFirestore _firebaseFirestore;
  RepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._firebaseFirestore);
  @override
  Future<Either<Failure, UserCredential>> signUp(
      SignUpRequest signUpRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.signUp(signUpRequest);
        await createUser(response, signUpRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }

  Future<void> createUser(
      UserCredential userCredential, SignUpRequest signUpRequest) async {
    _firebaseFirestore.collection("users").doc(userCredential.user!.uid).set({
      "id": userCredential.user!.uid,
      "name": signUpRequest.name,
      "email": signUpRequest.email
    });
  }

  @override
  Future<Either<Failure, UserCredential>> logIn(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.logIn(loginRequest);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
}
