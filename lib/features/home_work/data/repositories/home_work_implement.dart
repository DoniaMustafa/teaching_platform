import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/home_work/data/data_sources/home_work_data_source.dart';
import 'package:teaching/features/home_work/domain/repositories/home_work_repo.dart';

class HomeWorkImplement extends HomeWorkRepo {
  HomeWorkDataSource dataSource;

  HomeWorkImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getMyHomeWork(
          {TeacherModel? model}) async =>
      execute(() => dataSource.getMyHomeWork(model: model));

  @override
  Future<Either<Failure, ResponseModel>> getMyHomeWorkQuestion({int? examId})async =>
      execute(() => dataSource.getMyHomeWorkQuestion(examId: examId));
}
