import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscription_details/domain/repositories/subscription_details_repo.dart';

class SubscriptionDetailsUseCase {
  SubscriptionDetailsRepo repo;
  Future<Either<Failure, ResponseModel>> getSubscribeGroupDetails({required TeacherModel model})=>repo.getSubscribeGroupDetails(model: model);
  SubscriptionDetailsUseCase(this.repo);
}
