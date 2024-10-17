import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/courses_details_repo.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/subscribe_courses_repo.dart';

class SubscribeCoursesUseCase {
  SubscribeCoursesRepo repo;
  Future<Either<Failure, ResponseModel>> addSubscribeCourse(
          {TeacherCourse? teacherCourse}) =>
      repo.addSubscribeCourse(teacherCourse: teacherCourse);

  SubscribeCoursesUseCase(this.repo);
}
