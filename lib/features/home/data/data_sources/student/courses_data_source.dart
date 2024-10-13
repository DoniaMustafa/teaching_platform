import '../../../../../core/export/export.dart';

abstract class CoursesDataSource {
  Future<ResponseModel> getCourser({int? subjectId});
}

class CoursesWithServer extends CoursesDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getCourser({int? subjectId}) async => remoteExecute(
      request: dioConsumer.getRequest(
          path: EnumService.coursesEndPointType(AppPrefs.user!.userRole),
          queryParams: {'subjectId': subjectId}),
      fromJsonFunction: CoursesResponseModel.fromJson);

  CoursesWithServer(this.dioConsumer);
}
