import 'package:teaching/features/subscription_details/data/data_sources/subscription_details_data_source.dart';
import 'package:teaching/features/subscription_details/domain/repositories/subscription_details_repo.dart';

class SubscriptionDetailsImplement extends SubscriptionDetailsRepo{
  SubscriptionDetailsDataSource dataSource;

  SubscriptionDetailsImplement(this.dataSource);
}