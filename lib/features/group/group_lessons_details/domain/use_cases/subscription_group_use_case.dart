import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/subscription_group_repo.dart';


class SubscriptionGroupUseCase {
  SubscriptionGroupRepo repo;
  Future<Either<Failure,ResponseModel>> subscriptionGroup({required int groupId})=>repo.subscriptionGroup(groupId: groupId);

  SubscriptionGroupUseCase(this.repo);
}
