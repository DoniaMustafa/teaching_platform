import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/repositories/student/courses_repo.dart';

import '../../repositories/student/ads_repo.dart';

class AdsUseCase {
  AdsRepo repo;
  AdsUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getAds
      () =>
      repo.getAds();
}
