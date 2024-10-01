import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class CoursesGroupsRepo {

  Future<Either<Failure,ResponseModel>> getCourserAndGroups();

}