import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/teacher/teacher_details/data/data_sources/teacher_details_data_source.dart';
import 'package:teaching/features/teacher/teacher_details/domain/repositories/teacher_details_repo.dart';

class TeacherDetailsImplement extends TeacherDetailsRepo {
  TeacherDetailsDataSource dataSource;

  TeacherDetailsImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getTeachersDetails(
          {TeacherModel? model}) =>
      execute(() => dataSource.getTeachersDetails(model: model));

  @override
  Future<Either<Failure, ResponseModel>> addTeachersReview(
          {PostRateParamsModel? model}) =>
      execute(() => dataSource.addTeachersReview(model: model));

  @override
  Future<Either<Failure, ResponseModel>> followTeachers(
          {TeacherModel? model}) =>
      execute(() => dataSource.followTeachers(model: model));
}
