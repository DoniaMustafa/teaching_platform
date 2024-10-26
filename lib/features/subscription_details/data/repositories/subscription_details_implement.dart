import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/subscription_details/data/data_sources/subscription_details_data_source.dart';
import 'package:teaching/features/subscription_details/domain/repositories/subscription_details_repo.dart';

class SubscriptionDetailsImplement extends SubscriptionDetailsRepo{
  SubscriptionDetailsDataSource dataSource;

  SubscriptionDetailsImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getSubscribeGroupDetails({required TeacherModel model})=>execute(()=>dataSource.getSubscribeGroupDetails(model: model));
}