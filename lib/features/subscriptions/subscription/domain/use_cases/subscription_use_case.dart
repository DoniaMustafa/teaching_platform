import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/repositories/student/courses_repo.dart';
import 'package:teaching/features/home/domain/repositories/student/near_school_repo.dart';

import '../../../../home/domain/repositories/student/ads_repo.dart';
import '../repositories/subscription_repo.dart';

class SubscriptionUseCase {
  SubscriptionRepo repo;
  SubscriptionUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getSubscription
      () =>
      repo.getSubscription();

  Future<Either<Failure, ResponseModel>> getStudentSubscriptionsGroups
      ({TeacherModel? model}) =>
      repo.getStudentSubscriptionsGroups(model:model);
  Future<Either<Failure, ResponseModel>> getStudentSubscriptionsCourses
      ({TeacherModel? model}) =>
      repo.getStudentSubscriptionsCourses(model:model );
}
