import 'package:teaching/features/subscription/data/models/subscription_response_model.dart';

import '../../../../../core/export/export.dart';

abstract class SubscriptionsDataSource {
  Future<ResponseModel> getStudentSubscriptions();

}
class  SubscriptionsWithServer extends SubscriptionsDataSource{
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getStudentSubscriptions() async =>  remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getStudentSubscriptions,
      ),
      fromJsonFunction: SubscriptionResponseModel.fromJson);

  SubscriptionsWithServer(this.dioConsumer);
}