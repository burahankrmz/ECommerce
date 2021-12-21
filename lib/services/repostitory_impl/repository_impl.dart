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
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, UserCredential>> signUp(
      SignUpRequest signUpRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.signUp(signUpRequest);
          return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
}
