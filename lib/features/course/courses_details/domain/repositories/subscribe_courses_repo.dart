import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';


abstract class SubscribeCoursesRepo {
  Future<Either<Failure, ResponseModel>> addSubscribeCourse(
      {TeacherCourse? teacherCourse});
}