import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';

abstract class SubscribeCourseDataSource {
  Future<ResponseModel> addSubscribeCourse({TeacherCourse? teacherCourse});
}

class SubscribeCourseWithServer extends SubscribeCourseDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> addSubscribeCourse(
          {TeacherCourse? teacherCourse}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.subscribeCourseOrLesson,
              queryParams: teacherCourse!.toJson()),
          fromJsonFunction: ResponseModel.fromJson);

  SubscribeCourseWithServer(this.dioConsumer);
}
