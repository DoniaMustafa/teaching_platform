import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';

import '../../../../../core/export/export.dart';

abstract class CoursesDataSource {
  Future<ResponseModel> getCourser({TeacherModel? model});
}

class CoursesWithServer extends CoursesDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getCourser({TeacherModel? model}) async => remoteExecute(
      request: dioConsumer.getRequest(
          path: EnumService.coursesEndPointType(AppPrefs.user!.userRole),
          queryParams:model.isNull?null: model!.toJson()),
      fromJsonFunction: CoursesResponseModel.fromJson);

  CoursesWithServer(this.dioConsumer);
}
