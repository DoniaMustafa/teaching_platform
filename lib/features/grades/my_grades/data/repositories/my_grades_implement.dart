import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

import '../../domain/repositories/my_grades_repo.dart';
import '../data_sources/my_grades_data_source.dart';

class MyGradesImplement extends MyGradesRepo {
  MyGradesDataSource dataSource;

  MyGradesImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getMyGrades({TeacherModel? model}) =>
      execute(() => dataSource.getMyGrades(model: model));
}
