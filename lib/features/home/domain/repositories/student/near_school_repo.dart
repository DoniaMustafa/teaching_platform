import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class NearSchoolRepo {

  Future<Either<Failure,ResponseModel>> getNearSchool();

}