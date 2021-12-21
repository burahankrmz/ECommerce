import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/init/network/failure/failure.dart';
import 'package:ecommerce/core/init/network/repository/repository.dart';
import 'package:ecommerce/core/init/network/usecases/base_usecase.dart';
import 'package:ecommerce/features/auth/signup/services/signup_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpUseCase implements BaseUsecase<SingUpUsecaseInput, UserCredential> {
  final Repository _repository;
  SingUpUseCase(this._repository);
  @override
  Future<Either<Failure, UserCredential>> execute(input) async {
    return await _repository
        .signUp(SignUpRequest(input.name, input.email, input.password));
  }
}

class SingUpUsecaseInput {
  String name;
  String email;
  String password;
  SingUpUsecaseInput(this.name, this.email, this.password);
}
