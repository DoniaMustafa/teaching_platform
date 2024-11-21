import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class ParentStatisticsForChildrenRepo {
  Future<Either<Failure,ResponseModel>> getStudentCoursesRate({required int studentId});
  Future<Either<Failure,ResponseModel>> getStudentOpenGroupVideosRate({required int studentId});
  Future<Either<Failure,ResponseModel>> getParentStudentExamSuccessRate(
      {required int studentId});
  Future<Either<Failure,ResponseModel>>getStudentOpenCourseVideosRate(
      {required int studentId});
}
