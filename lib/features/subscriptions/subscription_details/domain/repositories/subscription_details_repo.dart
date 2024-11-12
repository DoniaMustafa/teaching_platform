import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class SubscriptionDetailsRepo {

  Future<Either<Failure,ResponseModel>>getSubscribeGroupDetails({required TeacherModel model});
  Future<Either<Failure,ResponseModel>>getSubscribeCourseDetails({required TeacherModel model});
}
