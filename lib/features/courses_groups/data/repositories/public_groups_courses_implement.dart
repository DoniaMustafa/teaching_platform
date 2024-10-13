import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/data/data_sources/public_groups_courses_Data_source.dart';
import 'package:teaching/features/courses_groups/domain/repositories/public_groups_courses_repo.dart';

class PublicGroupsCoursesImplement extends PublicGroupsCoursesRepo {
  PublicGroupsCoursesDataSource dataSource;
  @override
  Future<Either<Failure, ResponseModel>> getPublicGroupsCourses({int?subjectId}) async =>
      execute(() => dataSource.getPublicGroupsCourses(subjectId:subjectId ));

  PublicGroupsCoursesImplement(this.dataSource);
}
