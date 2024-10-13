import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/data_sources/courses_details_d/courses_details_data_source.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/courses_details_repo.dart';

class CoursesDetailsImplement extends CoursesDetailsRepo {
  CoursesDetailsDataSource coursesDetails;
  @override
  Future<Either<Failure, ResponseModel>> getCourseDetails(
          {required TeacherModel model}) async =>
      execute(() => coursesDetails.getCourseDetails(model: model));

  CoursesDetailsImplement(this.coursesDetails);
}
