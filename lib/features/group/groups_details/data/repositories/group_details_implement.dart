import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/groups_details/data/data_sources/group_lessons_details_data_sources.dart';
import 'package:teaching/features/group/groups_details/domain/repositories/group_details_repo.dart';

class GroupDetailsImplement extends GroupDetailsRepo {
  GroupDetailsDataSources dataSources;
  GroupDetailsImplement(this.dataSources);

  @override
  Future<Either<Failure, ResponseModel>> getGroupDetails(
          {required int teacherId, int? subjectId}) async =>
      execute(() => dataSources.getGroupDetails(
          teacherId: teacherId, subjectId: subjectId));
}
