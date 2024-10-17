import 'package:dartz/dartz.dart';

import '../../../../../core/export/export.dart';

abstract class TeacherDetailsRepo {
  Future<Either<Failure,ResponseModel>> getTeachersDetails({TeacherModel? model});
  Future<Either<Failure,ResponseModel>> addTeachersReview({PostRateParamsModel? model});
  Future<Either<Failure,ResponseModel>>followTeachers({TeacherModel? model});
}

