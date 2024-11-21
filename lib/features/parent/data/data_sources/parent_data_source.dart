import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/data/models/student_request_parents_model.dart';

abstract class ParentDataSource {
  Future<ResponseModel> getParents({TeacherModel? model});
  Future<ResponseModel> getStudentRequestParents();
  Future<ResponseModel> rejectStudentParentRequest({required int parentId});
  Future<ResponseModel> addStudentRequest({required int parentId});
  Future<ResponseModel> cancelStudentParentRequest({required int parentId});
  Future<ResponseModel> acceptStudentParentRequest({required int parentId});
  Future<ResponseModel> getStudentRequestParentCount();

  Future<ResponseModel> deleteParentStudent({required int studentId});

  Future<ResponseModel> getParentsToAddRequest(
      {String? parentName, String? phoneNumber});
}

class ParentWithServer extends ParentDataSource {
  DioConsumer consumer;

  ParentWithServer(this.consumer);

  @override
  Future<ResponseModel> getParents({TeacherModel? model}) async =>
      remoteExecute(
          request: consumer.getRequest(
              path: EndPoints.getStudentParents,
              queryParams: model.isNull ? null : model!.toJson()),
          fromJsonFunction: PublicResponseModel.fromJson);

  @override
  Future<ResponseModel> getStudentRequestParents() async => remoteExecute(
      request: consumer.getRequest(
        path: EndPoints.getStudentRequestParents,
      ),
      fromJsonFunction: StudentRequestParentsResponseModel.fromJson);
  @override
  Future<ResponseModel> getStudentRequestParentCount() async => remoteExecute(
      request: consumer.getRequest(
        path: EndPoints.getParentRequestCount,
      ),
      fromJsonFunction: ResponseModel.fromJson);

  @override
  Future<ResponseModel> acceptStudentParentRequest(
          {required int parentId}) async =>
      remoteExecute(
          request: consumer.postRequest(
              path: EndPoints.acceptStudentParentRequest,
              queryParams: {"parentRequestId": parentId}),
          fromJsonFunction: ResponseModel.fromJson);

  @override
  Future<ResponseModel> addStudentRequest({required int parentId}) async =>
      remoteExecute(
          request: consumer.postRequest(
              path: EndPoints.addStudentRequest,
              queryParams: {"parentId": parentId}),
          fromJsonFunction: ResponseModel.fromJson);

  @override
  Future<ResponseModel> cancelStudentParentRequest(
          {required int parentId}) async =>
      remoteExecute(
          request: consumer.postRequest(
              path: EndPoints.cancelParentRequest,
              queryParams: {"parentRequestId": parentId}),
          fromJsonFunction: ResponseModel.fromJson);

  @override
  Future<ResponseModel> rejectStudentParentRequest(
          {required int parentId}) async =>
      remoteExecute(
          request: consumer.postRequest(
              path: EndPoints.rejectParentRequest,
              queryParams: {"parentRequestId": parentId}),
          fromJsonFunction: ResponseModel.fromJson);

  @override
  Future<ResponseModel> getParentsToAddRequest(
          {String? parentName, String? phoneNumber}) async =>
      remoteExecute(
          request: consumer.getRequest(
              path: EndPoints.getParentsToAddRequest,
              queryParams:
                  parentName.isNotNull ? {"phoneNumber": phoneNumber} : null),
          fromJsonFunction: PublicResponseModel.fromJson);

  @override
  Future<ResponseModel> deleteParentStudent({required int studentId}) async =>
      remoteExecute(
          request: consumer.putRequest(
              path: EndPoints.deleteParentStudent,
              queryParams: {"studentId": studentId}),
          fromJsonFunction: ResponseModel.fromJson);
}
