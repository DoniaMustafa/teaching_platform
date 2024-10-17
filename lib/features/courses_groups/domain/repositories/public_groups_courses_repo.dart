import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class PublicGroupsCoursesRepo {
  Future<Either<Failure,ResponseModel>> getPublicGroupsCourses({TeacherModel? model});
  Future<Either<Failure,ResponseModel>> getPublicGroups({TeacherModel? model});
}

