import '../../../../../core/export/export.dart';

abstract class CoursesGroupsDataSource {
  Future<ResponseModel> getCourserAndGroups();
}

class CoursesGroupsWithServer extends CoursesGroupsDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getCourserAndGroups() async =>  remoteExecute(
      request: dioConsumer.getRequest(
        path: EndPoints.homeCoursesAndGroups,
      ),
      fromJsonFunction: CourserAndGroupsResponseModel.fromJson);

  CoursesGroupsWithServer(this.dioConsumer);
}
