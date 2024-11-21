import 'package:dartz/dartz.dart';

import '../../../../../core/export/export.dart';

abstract class MyGradesRepo {
  Future<Either<Failure,ResponseModel>> getMyGrades({TeacherModel? model});
}

