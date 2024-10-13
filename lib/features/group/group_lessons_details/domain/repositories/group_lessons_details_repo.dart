import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';


abstract class GroupLessonsDetailsRepo {
  Future<Either<Failure,ResponseModel>> getGroupLessonsDetails({required int lessonId});
}
