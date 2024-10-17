 import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/domain/repositories/exam_repo.dart';

class ExamUseCase {
   ExamRepo repo;

   ExamUseCase(this.repo);

   Future<Either<Failure,ResponseModel>> getExams({ExamParamsModel? model})=>repo.getExams(model: model);
}
