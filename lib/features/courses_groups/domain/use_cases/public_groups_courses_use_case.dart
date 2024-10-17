import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/domain/repositories/public_groups_courses_repo.dart';

class PublicGroupsCoursesUseCase {
  PublicGroupsCoursesRepo repo;

  Future<Either<Failure, ResponseModel>> getPublicCourses({TeacherModel? model}) async =>
      await repo.getPublicGroupsCourses(model:model );
  Future<Either<Failure,ResponseModel>> getPublicGroups({TeacherModel? model}) async =>
      await repo.getPublicGroups(model:model );
  PublicGroupsCoursesUseCase(this.repo);
}
