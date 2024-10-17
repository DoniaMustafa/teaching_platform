import 'package:teaching/core/export/export.dart';

abstract class SubscriptionDetailsDataSource {
  Future<ResponseModel>getSubscribeGroupDetails({required TeacherModel model});
  // Future<ResponseModel>getSubscribeCourseDetails({required TeacherModel model});
}

class SubscriptionDetailsWithServer extends SubscriptionDetailsDataSource {
  SubscriptionDetailsWithServer(this.dioConsumer);

  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getSubscribeGroupDetails({required TeacherModel model})async =>
  remoteExecute(
  request: dioConsumer.getRequest(
  path: EndPoints.getStudentSubscriptionsGroupsDetails,
  queryParams: model.toJson()),
  fromJsonFunction: GroupDetailsResponseModel.fromJson);

//   @override
//   Future<ResponseModel> getSubscribeCourseDetails({required TeacherModel model}) ({required TeacherModel model})async =>
// remoteExecute(
// request: dioConsumer.getRequest(
// path: EndPoints.getStudentSubscriptionsGroupsDetails,
// queryParams: model.toJson()),
// fromJsonFunction: GroupDetailsResponseModel.fromJson);
}
