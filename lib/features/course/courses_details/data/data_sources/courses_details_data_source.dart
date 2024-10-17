import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';

abstract class CoursesDetailsDataSource {
  Future<ResponseModel> getCourseDetails({required TeacherModel model});
}

class CoursesDetailsWithServer extends CoursesDetailsDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> getCourseDetails({required TeacherModel model}) async =>
      remoteExecute(
          request: dioConsumer.getRequest(
              path: EndPoints.getCoursesDetails, queryParams: model.toJson()),
          fromJsonFunction: CourseDetailsResponseModel.fromJson);

  CoursesDetailsWithServer(this.dioConsumer);
}
