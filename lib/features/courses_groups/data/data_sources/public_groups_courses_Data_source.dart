import 'package:teaching/core/export/export.dart';


abstract class PublicGroupsCoursesDataSource {
  Future<ResponseModel> getPublicGroupsCourses({int?subjectId});
}

class PublicGroupsCoursesWithServer extends PublicGroupsCoursesDataSource {
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getPublicGroupsCourses({int?subjectId}) async => remoteExecute(
      request: dioConsumer.getRequest(
          path: EndPoints.getPublicTeachersGroupedCourses,
      queryParams: {
            "subjectId":subjectId
      }
      ),
      fromJsonFunction: CoursesResponseModel.fromJson);

  PublicGroupsCoursesWithServer(this.dioConsumer);
}
