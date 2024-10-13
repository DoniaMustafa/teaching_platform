import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';


abstract class CoursesDetailsRepo {
  Future<Either<Failure, ResponseModel>> getCourseDetails(
      {required TeacherModel model});
}
