import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/repositories/student/courses_groups_repo.dart';

class CoursesGroupsUseCase {
  CoursesGroupsRepo repo;
  CoursesGroupsUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getCourserAndGroups() =>
      repo.getCourserAndGroups();
}
