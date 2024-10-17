import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/data/data_sources/public_groups_courses_Data_source.dart';
import 'package:teaching/features/courses_groups/domain/repositories/public_groups_courses_repo.dart';

class PublicGroupsCoursesImplement extends PublicGroupsCoursesRepo {
  PublicGroupsCoursesDataSource dataSource;
  @override
  Future<Either<Failure, ResponseModel>> getPublicGroupsCourses({TeacherModel? model}) async =>
      execute(() => dataSource.getPublicCourses(model:model ));

  PublicGroupsCoursesImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getPublicGroups({TeacherModel? model})  async =>
      execute(() => dataSource.getPublicGroups(model:model ));

}
