import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/init/network/failure/failure.dart';
import '../../../../core/init/network/repository/repository.dart';
import '../../../../core/init/network/usecases/base_usecase.dart';
import 'login_request.dart';

class LoginUseCase implements BaseUsecase<LoginUseCaseInput, UserCredential> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, UserCredential>> execute(
      LoginUseCaseInput input) async {
    return await _repository.logIn(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}
