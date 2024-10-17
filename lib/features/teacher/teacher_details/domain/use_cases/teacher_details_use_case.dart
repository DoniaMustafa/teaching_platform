import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teacher_details/domain/repositories/teacher_details_repo.dart';

class TeacherDetailsUseCase {
  TeacherDetailsRepo repo;

  TeacherDetailsUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getTeachersDetails(
          {TeacherModel? model}) =>
      repo.getTeachersDetails(model: model);

  Future<Either<Failure, ResponseModel>> addTeachersReview(
          {PostRateParamsModel? model}) =>
      repo.addTeachersReview(model: model);

  Future<Either<Failure,ResponseModel>>followTeachers({TeacherModel? model}) =>
      repo.followTeachers(model: model);

}
