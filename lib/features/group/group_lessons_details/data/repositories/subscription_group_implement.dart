import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/data/data_sources/group_lessons_details_data_sources.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/group_lessons_details_repo.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/subscription_group_repo.dart';

import '../data_sources/subscription_group_data_sources.dart';

class SubscriptionGroupImplement extends SubscriptionGroupRepo {
  SubscriptionGroupDataSources dataSources;
  SubscriptionGroupImplement(this.dataSources);

  @override
  Future<Either<Failure, ResponseModel>> subscriptionGroup(
          {required int groupId}) async =>
      execute(() => dataSources.subscriptionGroup(groupId: groupId));
}
