import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/data_sources/courses_details_data_source.dart';
import 'package:teaching/features/course/courses_details/data/data_sources/subscribe_course_data_source.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/courses_details_repo.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/subscribe_courses_repo.dart';

class SubscribeCoursesImplement extends SubscribeCoursesRepo {
  SubscribeCourseDataSource subscribeDetails;
  @override
  Future<Either<Failure, ResponseModel>> addSubscribeCourse(
          {TeacherCourse? teacherCourse}) async =>
      execute(() =>
          subscribeDetails.addSubscribeCourse(teacherCourse: teacherCourse));

  SubscribeCoursesImplement(this.subscribeDetails);
}
