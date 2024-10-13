import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/data/data_sources/student/courses_data_source.dart';
import 'package:teaching/features/home/domain/repositories/student/groups_repo.dart';
import '../../../domain/repositories/student/courses_repo.dart';
import '../../data_sources/student/groups_data_source.dart';

class GroupsImplement extends GroupsRepo {
  GroupsDataSource courses;
  GroupsImplement(this.courses);

  @override
  Future<Either<Failure, ResponseModel>> getGroups({int? subjectId}) => execute(
        () => courses.getGroups(subjectId: subjectId),
      );
}
