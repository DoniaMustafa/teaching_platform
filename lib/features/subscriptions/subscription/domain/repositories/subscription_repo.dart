import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class SubscriptionRepo {

  Future<Either<Failure,ResponseModel>> getSubscription();
 Future<Either<Failure,ResponseModel>> getStudentSubscriptionsCourses({TeacherModel? model});
 Future<Either<Failure,ResponseModel>> getStudentSubscriptionsGroups({TeacherModel? model});
}