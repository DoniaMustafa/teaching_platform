import 'package:dartz/dartz.dart';
import 'package:teaching/features/auth/domain/repositories/education_type_repo.dart';
import '../../../../core/export/export.dart';

class EducationTypeUseCase {
  EducationTypeUseCase(this.repo);
  EducationTypeRepo repo;
  Future<Either<Failure, ResponseModel>> getEducationType() async =>
      repo.getEducationType();
  Future<Either<Failure, ResponseModel>> getEducationPrograms(
          {required int id}) async =>
      repo.getEducationPrograms(id: id);
  Future<Either<Failure, ResponseModel>> getGrade(
          {required int educationProgramsId,
          required int educationTypeId}) async =>
      repo.getGrade(
          educationProgramsId: educationProgramsId,
          educationTypeId: educationTypeId);

  Future<Either<Failure, ResponseModel>> getSubjects(
          {required int educationProgramsId,
          required int educationTypeId,
          required int gradeId}) async =>
      repo.getSubjects(
          educationProgramsId: educationProgramsId,
          educationTypeId: educationTypeId,
          gradeId: gradeId);
}
