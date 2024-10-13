import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home/domain/repositories/student/courses_repo.dart';

import '../../repositories/student/groups_repo.dart';

class GroupsUseCase {
  GroupsRepo repo;
  GroupsUseCase(this.repo);
  Future<Either<Failure, ResponseModel>> getGroups({int? subjectId}) =>
      repo.getGroups(subjectId:subjectId );
}
