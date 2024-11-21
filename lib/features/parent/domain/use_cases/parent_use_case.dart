import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/parent/domain/repositories/parent_repo.dart';

class ParentUseCase {
  ParentRepo repo;
  Future<Either<Failure, ResponseModel>> getParents({TeacherModel? model}) =>
      repo.getParents(model: model);
  Future<Either<Failure, ResponseModel>> getStudentRequestParents() =>
      repo.getStudentRequestParents();
  Future<Either<Failure, ResponseModel>> rejectStudentParentRequest(
          {required int parentId}) =>
      repo.rejectStudentParentRequest(parentId: parentId);
  Future<Either<Failure, ResponseModel>> addStudentRequest(
          {required int parentId}) =>
      repo.addStudentRequest(parentId: parentId);
  Future<Either<Failure, ResponseModel>> cancelStudentParentRequest(
          {required int parentId}) =>
      repo.cancelStudentParentRequest(parentId: parentId);
  Future<Either<Failure, ResponseModel>> acceptStudentParentRequest(
          {required int parentId}) =>
      repo.acceptStudentParentRequest(parentId: parentId);
  Future<Either<Failure, ResponseModel>> getStudentRequestParentCount() =>
      repo.getStudentRequestParentCount();
  Future<Either<Failure, ResponseModel>> getParentsToAddRequest(
          {String? parentName, String? phoneNumber}) =>
      repo.getParentsToAddRequest(
          phoneNumber: phoneNumber, parentName: parentName);

  Future<Either<Failure, ResponseModel>> deleteParentStudent(
          {required int studentId}) =>
      repo.deleteParentStudent(
        studentId: studentId,
      );

  ParentUseCase(this.repo);
}
