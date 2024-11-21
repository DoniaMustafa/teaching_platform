import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class TeacherOfParentRepo {

  Future<Either<Failure,ResponseModel>> getTeacherOfParent({TeacherModel? model});
  Future<Either<Failure,ResponseModel>> getFollowingTeachers();
}