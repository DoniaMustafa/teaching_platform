import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';


abstract class CommentOnLessonsRepo {
  Future<Either<Failure,ResponseModel>> addCommentOnVideo({required int videoId,required String comment});
}

