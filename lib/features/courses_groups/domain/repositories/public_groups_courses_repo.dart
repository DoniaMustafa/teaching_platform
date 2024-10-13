import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class PublicGroupsCoursesRepo {
  Future<Either<Failure,ResponseModel>> getPublicGroupsCourses({int?subjectId});
}

