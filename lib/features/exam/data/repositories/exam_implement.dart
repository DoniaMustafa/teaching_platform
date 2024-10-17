import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/exam/data/data_sources/exam_data_source.dart';
import 'package:teaching/features/exam/domain/repositories/exam_repo.dart';

class ExamImplement extends ExamRepo {
  ExamDataSource dataSource;

  ExamImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getExams(
          {ExamParamsModel? model}) async =>
      execute(() => dataSource.getExams(model: model));
}
