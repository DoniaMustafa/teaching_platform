import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class SubscriptionRepo {

  Future<Either<Failure,ResponseModel>> getSubscription();

}