import 'package:dartz/dartz.dart';
import 'package:teaching/features/auth/data/data_sources/education_type_remote_datasource.dart';
import '../../../../core/export/export.dart';
import '../../domain/repositories/education_type_repo.dart';

class EducationTypeImplement extends EducationTypeRepo {
  EducationTypeRemoteDatasource datasource;
  EducationTypeImplement(this.datasource);

  @override
  Future<Either<Failure, ResponseModel>> getEducationPrograms(
          {required int id}) async =>
      execute(
        () => datasource.getEducationPrograms(id: id),
      );

  @override
  Future<Either<Failure, ResponseModel>> getEducationType() async => execute(
        () => datasource.getEducationType(),
      );

  @override
  Future<Either<Failure, ResponseModel>> getGrade(
          {required int educationProgramsId,
          required int educationTypeId}) async =>
      execute(
        () => datasource.getGrade(
            educationProgramsId: educationProgramsId,
            educationTypeId: educationTypeId),
      );

  @override
  Future<Either<Failure, ResponseModel>> getSubjects({required int educationProgramsId,
    required int educationTypeId, required int gradeId}) async =>
      execute(
            () => datasource.getSubjects(
            educationProgramsId: educationProgramsId,
            educationTypeId: educationTypeId,gradeId: gradeId),
      );
}
