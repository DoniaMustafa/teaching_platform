import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import '../../domain/repositories/subscription_repo.dart';
import '../data_sources/subscriptions_data_source.dart';

class SubscriptionImplement extends SubscriptionRepo {
  SubscriptionsDataSource adsDataSource;
  SubscriptionImplement(this.adsDataSource);

  @override
  Future<Either<Failure, ResponseModel>> getSubscription() => execute(
        () => adsDataSource.getStudentSubscriptions(),
      );

  @override
  Future<Either<Failure, ResponseModel>> getStudentSubscriptionsCourses({TeacherModel? model}) =>
      execute(
        () => adsDataSource.getStudentSubscriptionsCourses(model: model),
      );

  @override
  Future<Either<Failure, ResponseModel>> getStudentSubscriptionsGroups({TeacherModel? model}) =>
      execute(
        () => adsDataSource.getStudentSubscriptionsGroups(model: model),
      );
}
