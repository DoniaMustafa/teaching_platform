import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class NearSchoolDetailsRepo {
  Future<Either<Failure,ResponseModel>> getNearSchoolDetails({required int id});
}

