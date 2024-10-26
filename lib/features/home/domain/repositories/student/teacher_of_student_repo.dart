import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class TeacherOfStudentRepo {

  Future<Either<Failure,ResponseModel>> getTeacherOfStudent({TeacherModel? model});

}