import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';


abstract class LessonsDetailsRepo {
  Future<Either<Failure,ResponseModel>> getLessonsDetails({required int lessonId});
}
