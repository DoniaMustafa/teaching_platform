 import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/lessons_details_repo.dart';

class LessonsDetailsUseCase {
   LessonsDetailsRepo repo;

   LessonsDetailsUseCase(this.repo);

   Future<Either<Failure,ResponseModel>> getLessonsDetails({required int lessonId})async=>await repo.getLessonsDetails(lessonId: lessonId);
}
