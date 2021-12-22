import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/init/network/failure/failure.dart';
import 'package:ecommerce/core/init/network/repository/repository.dart';
import 'package:ecommerce/core/init/network/usecases/base_usecase.dart';

class ForgotPasswordUseCase
    implements BaseUsecase<ForgotPasswordUseCaseInput, String> {
  final Repository _repository;
  ForgotPasswordUseCase(this._repository);
  @override
  Future<Either<Failure, String>> execute(input) async {
    return await _repository.forgotPassword(input.email);
  }
}

class ForgotPasswordUseCaseInput {
  String email;
  ForgotPasswordUseCaseInput(this.email);
}
