import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/comment_on_lessons_repo.dart';

class CommentOnLessonsUseCase {
  CommentOnLessonsRepo repo;
  Future<Either<Failure, ResponseModel>> addCommentOnVideo(
          {required int videoId,
          required String comment,
          bool isCourse = true}) async =>
      await repo.addCommentOnVideo(
          videoId: videoId, comment: comment, isCourse: isCourse);

  CommentOnLessonsUseCase(this.repo);
}
