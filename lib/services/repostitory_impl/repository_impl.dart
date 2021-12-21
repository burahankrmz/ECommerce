import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/core/init/network/data_source/remote_data_source.dart';
import 'package:ecommerce/core/init/network/error_handler/error_handler.dart';
import 'package:ecommerce/core/init/network/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/init/network/networkinfo/network_info.dart';
import 'package:ecommerce/core/init/network/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/features/auth/signup/services/signup_request.dart';

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
    _firebaseFirestore
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({"id": userCredential.user!.uid, "email": signUpRequest.email});
  }
}
