import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';


abstract class SubscriptionGroupRepo {
  Future<Either<Failure,ResponseModel>> subscriptionGroup({required int groupId});
}
