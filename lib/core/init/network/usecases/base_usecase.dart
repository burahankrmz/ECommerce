import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/init/network/failure/failure.dart';

abstract class BaseUsecase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
