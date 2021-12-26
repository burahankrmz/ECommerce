import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/init/network/failure/failure.dart';
import 'package:ecommerce/core/init/network/repository/repository.dart';
import 'package:ecommerce/core/init/network/usecases/base_usecase.dart';
import 'package:ecommerce/features/main/home/model/product_model.dart';

class HomeUseCase implements BaseUsecase<void, Products> {
  final Repository _repository;
  HomeUseCase(this._repository);
  @override
  Future<Either<Failure, Products>> execute(void input) async {
    return await _repository.getHome1Products();
  }
}