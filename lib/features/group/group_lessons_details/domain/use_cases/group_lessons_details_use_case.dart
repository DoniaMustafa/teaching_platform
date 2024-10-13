 import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/group/group_lessons_details/domain/repositories/group_lessons_details_repo.dart';

class GroupLessonsDetailsUseCase {
   GroupLessonsDetailsRepo repo;

   GroupLessonsDetailsUseCase(this.repo);

   Future<Either<Failure,ResponseModel>> getGroupLessonsDetails({required int lessonId})async=>await repo.getGroupLessonsDetails(lessonId: lessonId);
}
