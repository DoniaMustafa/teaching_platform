import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class CoursesRepo {

  Future<Either<Failure,ResponseModel>> getCourser({TeacherModel? model});

}