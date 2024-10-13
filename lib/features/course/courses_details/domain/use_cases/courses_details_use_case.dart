import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';
import 'package:teaching/features/course/courses_details/domain/repositories/courses_details_repo.dart';


 class CoursesDetailsUseCase {
  CoursesDetailsRepo repo;
  Future <Either<Failure,ResponseModel>>getCourseDetails({required TeacherModel model})async=>await repo.getCourseDetails(model: model);

  CoursesDetailsUseCase(this.repo);
}

