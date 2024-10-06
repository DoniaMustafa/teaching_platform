import 'package:dartz/dartz.dart';
import '../../../../core/export/export.dart';

 abstract class EducationTypeRepo {
  Future<Either<Failure,ResponseModel>> getEducationType();
  Future<Either<Failure,ResponseModel>> getEducationPrograms({required int id});
  Future<Either<Failure,ResponseModel>> getGrade(
      {required int educationProgramsId, required int educationTypeId});
}

