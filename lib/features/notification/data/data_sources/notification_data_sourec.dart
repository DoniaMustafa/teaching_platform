import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notification/data/models/notification_response_model.dart';

abstract class NotificationDataSource {
  Future<ResponseModel> getNotification();
  Future<ResponseModel> getMarkNotificationAsRead({required int id});
}

class NotificationWithServer extends NotificationDataSource {
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getNotification() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getNotification,
      ),
      fromJsonFunction: NotificationResponseModel.fromJson);

  NotificationWithServer(this.dioConsumer);

  @override
  Future<ResponseModel> getMarkNotificationAsRead({required int id}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.markNotificationAsRead,
              queryParams: {"notificationId": id}),
          fromJsonFunction: ResponseModel.fromJson);
}
