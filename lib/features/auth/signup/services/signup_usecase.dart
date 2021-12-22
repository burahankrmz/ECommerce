import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/init/network/failure/failure.dart';
import '../../../../core/init/network/repository/repository.dart';
import '../../../../core/init/network/usecases/base_usecase.dart';
import 'signup_request.dart';

class SignUpUseCase implements BaseUsecase<SignUpUseCaseInput, UserCredential> {
  final Repository _repository;
  SignUpUseCase(this._repository);
  @override
  Future<Either<Failure, UserCredential>> execute(input) async {
    return await _repository
        .signUp(SignUpRequest(input.name, input.email, input.password));
  }
}

class SignUpUseCaseInput {
  String name;
  String email;
  String password;
  SignUpUseCaseInput(this.name, this.email, this.password);
}
