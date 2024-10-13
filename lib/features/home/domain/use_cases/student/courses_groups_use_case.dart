import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/repositories/student/courses_repo.dart';

class CoursesUseCase {
  CoursesRepo repo;
  CoursesUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getCourser({int? subjectId}) =>
      repo.getCourser(subjectId: subjectId);
}
