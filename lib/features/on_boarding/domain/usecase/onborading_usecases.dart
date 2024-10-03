import 'package:dartz/dartz.dart';
import 'package:teaching/core/model/response_model.dart';

import '../../../../core/network/abstract/failure.dart';
import '../repositories/onboarding_repo.dart';

class OnBoardingUsesCases {
  OnBoardingRepo onBoardingRepo;
  OnBoardingUsesCases({required this.onBoardingRepo});
  Future<Either<Failure, ResponseModel>> cacheNew() => onBoardingRepo.cacheNewUser();
  Future<Either<Failure, ResponseModel>> getNew() => onBoardingRepo.getNewUser();
}
