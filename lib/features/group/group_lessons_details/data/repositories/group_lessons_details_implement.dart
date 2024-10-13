import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/data/data_sources/group_lessons_details_data_sources.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/group_lessons_details_repo.dart';

class GroupLessonsDetailsImplement extends GroupLessonsDetailsRepo {
  GroupLessonsDetailsDataSources dataSources;
  GroupLessonsDetailsImplement(this.dataSources);

  @override
  Future<Either<Failure, ResponseModel>> getGroupLessonsDetails(
          {required int lessonId}) async =>
      execute(() => dataSources.getGroupLessonsDetails(lessonId: lessonId));
}
