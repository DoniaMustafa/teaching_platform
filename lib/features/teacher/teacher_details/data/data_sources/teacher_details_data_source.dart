import 'package:teaching/core/export/export.dart';

abstract class TeacherDetailsDataSource {
  Future<ResponseModel> getTeachersDetails({TeacherModel? model});
  Future<ResponseModel> addTeachersReview({PostRateParamsModel? model});
  Future<ResponseModel> followTeachers({TeacherModel? model});
}

class TeacherDetailsWithServer extends TeacherDetailsDataSource {
  DioConsumer consumer;

  TeacherDetailsWithServer(this.consumer);

  @override
  Future<ResponseModel> getTeachersDetails({TeacherModel? model}) async =>
      remoteExecute(
          request: consumer.getRequest(
              path: AppPrefs.userRole == "3"
                  ? EndPoints.getParentTeacherDetails
                  : EndPoints.getTeacherDetailsInStudent,
              queryParams: model!.toJson()),
          fromJsonFunction: TeacherDetailsResponseModel.fromJson);

  @override
  Future<ResponseModel> addTeachersReview({PostRateParamsModel? model}) async =>
      remoteExecute(
          request: consumer.postRequest(
              path: EndPoints.addTeacherReview, body: model!.toJson()),
          fromJsonFunction: ResponseModel.fromJson);

  @override
  Future<ResponseModel> followTeachers({TeacherModel? model}) async =>
      remoteExecute(
          request: consumer.postRequest(
              path: EndPoints.studentFollowTeacher,
              queryParams: model!.toJson()),
          fromJsonFunction: ResponseModel.fromJson);
}
