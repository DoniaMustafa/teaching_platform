import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class ParentRepo {
  Future<Either<Failure,ResponseModel>> getParents({TeacherModel? model});
  Future<Either<Failure,ResponseModel>> getStudentRequestParents();
  Future<Either<Failure,ResponseModel>> rejectStudentParentRequest({required int parentId});
  Future<Either<Failure,ResponseModel>> addStudentRequest({required int parentId});
  Future<Either<Failure,ResponseModel>> cancelStudentParentRequest({required int parentId});
  Future<Either<Failure,ResponseModel>> acceptStudentParentRequest({required int parentId});
  Future<Either<Failure,ResponseModel>> getStudentRequestParentCount();
  Future<Either<Failure,ResponseModel>> getParentsToAddRequest(
      { String? parentName,  String? phoneNumber});

  Future<Either<Failure,ResponseModel>> deleteParentStudent({required int studentId});

}

