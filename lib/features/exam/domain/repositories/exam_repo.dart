import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class ExamRepo {

  Future<Either<Failure,ResponseModel>> getExams({ExamParamsModel? model});

}
