import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/repositories/student/courses_groups_repo.dart';
import 'package:teaching/features/home/domain/repositories/student/near_school_repo.dart';

import '../../repositories/student/ads_repo.dart';
import '../../repositories/student/subscription_repo.dart';

class SubscriptionUseCase {
  SubscriptionRepo repo;
  SubscriptionUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getSubscription
      () =>
      repo.getSubscription();
}
