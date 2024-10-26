import 'package:teaching/features/group/group_lessons_details/data/models/group_Lesson_details_response_model.dart';

import '../../../../../core/export/export.dart';


abstract class SubscriptionGroupDataSources {
  Future<ResponseModel> subscriptionGroup({required int groupId});

}

class SubscriptionGroupWithServer extends SubscriptionGroupDataSources {
  SubscriptionGroupWithServer(this.dioConsumer);

  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> subscriptionGroup({required int groupId}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.subscriptionGroup,
              queryParams: {"groupId": groupId}),
          fromJsonFunction:ResponseModel.fromJson);
}
