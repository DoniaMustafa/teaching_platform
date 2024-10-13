import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/course/courses_lessons_details/data/data_sources/comment_on_lessons_data_sources.dart';
import 'package:teaching/features/course/courses_lessons_details/domain/repositories/comment_on_lessons_repo.dart';


class CommentOnLessonsImplement extends CommentOnLessonsRepo {
  CommentOnLessonsImplement(this.dataSources);


  CommentOnLessonsDataSources dataSources;
  @override
  Future<Either<Failure,ResponseModel>> addCommentOnVideo({required int videoId,required String comment})
  async =>execute(()=>dataSources.addCommentOnVideo(videoId: videoId, comment: comment));

}
