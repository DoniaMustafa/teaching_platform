import 'package:dartz/dartz.dart';
import 'package:teaching/core/model/response_model.dart';
import '../../../../core/helper/app_helper.dart';
import '../../../../core/network/abstract/failure.dart';
import '../../domain/repositories/onboarding_repo.dart';
import '../data_sources/onboarding_local_data_source.dart';

class OnBoardingRepoImpl extends OnBoardingRepo {
  OnBoardingLocalDataSource onBoardingLocalDataSource;
  OnBoardingRepoImpl({required this.onBoardingLocalDataSource});

  @override
  Future<Either<Failure, ResponseModel>> cacheNewUser() =>
      executeCache(() => onBoardingLocalDataSource.cacheNewUser());

  @override
  Future<Either<Failure, ResponseModel>> getNewUser() =>
      executeCache(() async => await onBoardingLocalDataSource.getNewUser());
}
