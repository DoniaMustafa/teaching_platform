import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_groups_data_source.dart';
import '../../../domain/repositories/student/courses_groups_repo.dart';

class CoursesGroupsImplement extends CoursesGroupsRepo {
  CoursesGroupsDataSource coursesAndGroups;
  CoursesGroupsImplement(this.coursesAndGroups);

  @override
  Future<Either<Failure, ResponseModel>> getCourserAndGroups() => execute(
        () => coursesAndGroups.getCourserAndGroups(),
      );
}
