import 'package:dartz/dartz.dart';
import 'package:teaching/core/model/response_model.dart';

import '../../../../core/network/abstract/failure.dart';

abstract class OnBoardingRepo {
  Future<Either<Failure, ResponseModel>> cacheNewUser();
  Future<Either<Failure, ResponseModel>> getNewUser();
}
