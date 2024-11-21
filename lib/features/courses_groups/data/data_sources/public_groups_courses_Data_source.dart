import 'package:teaching/core/export/export.dart';

abstract class PublicGroupsCoursesDataSource {
  Future<ResponseModel> getPublicCourses({TeacherModel? model});
  Future<ResponseModel> getPublicGroups({TeacherModel? model});
}

class PublicGroupsCoursesWithServer extends PublicGroupsCoursesDataSource {
  DioConsumer dioConsumer;
  @override
  Future<ResponseModel> getPublicCourses({TeacherModel? model}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: AppPrefs.userRole == "1"|| AppPrefs.userRole == "7"
                  ? EndPoints.getPublicTeachersGroupedCourses
                  : EndPoints.getPublicParentTeachersGroupedCourses,
              queryParams: model.isNotNull ? model!.toJson() : null),
          fromJsonFunction: CoursesResponseModel.fromJson);

  PublicGroupsCoursesWithServer(this.dioConsumer);

  @override
  Future<ResponseModel> getPublicGroups({TeacherModel? model}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: AppPrefs.userRole == "1"|| AppPrefs.userRole == "7"
                  ? EndPoints.getPublicTeachersGroupedGroup
                  : EndPoints.getPublicParentTeachersGroupedGroup,
              queryParams: model.isNotNull ? model!.toJson() : null),
          fromJsonFunction: GroupsResponseModel.fromJson);
}
