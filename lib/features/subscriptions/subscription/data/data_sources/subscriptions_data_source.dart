import '../../../../../core/export/export.dart';

abstract class SubscriptionsDataSource {
  Future<ResponseModel> getStudentSubscriptions();
  Future<ResponseModel> getStudentSubscriptionsCourses({TeacherModel? model});
  Future<ResponseModel> getStudentSubscriptionsGroups({TeacherModel? model});
}

class SubscriptionsWithServer extends SubscriptionsDataSource {
  DioConsumer dioConsumer;
  SubscriptionsWithServer(this.dioConsumer);

  @override
  Future<ResponseModel> getStudentSubscriptions() async => remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.getStudentSubscriptions,
      ),
      fromJsonFunction: SubscriptionResponseModel.fromJson);

  @override
  Future<ResponseModel> getStudentSubscriptionsCourses(
          {TeacherModel? model}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: AppPrefs.userRole == '1'
                  ? EndPoints.getStudentSubscriptionsCourses
                  : EndPoints.getParentStudentSubscriptionsCourses,
              queryParams: model.isNull ? null : model!.toJson()),
          fromJsonFunction: CoursesResponseModel.fromJson);

  @override
  Future<ResponseModel> getStudentSubscriptionsGroups(
          {TeacherModel? model}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: AppPrefs.userRole == '1'
                  ? EndPoints.getStudentSubscriptionsGroups
                  : EndPoints.getParentStudentSubscriptionsGroups,
              queryParams: model.isNull ? null : model!.toJson()),
          fromJsonFunction: GroupsResponseModel.fromJson);
}
