import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/courses_groups/domain/repositories/subject_repo.dart';

import '../data_sources/subject_Data_source.dart';

class SubjectImplement extends SubjectRepo {
  SubjectDataSource dataSource;
  @override
  Future<Either<Failure, ResponseModel>> getSubjects() async =>
      execute(() => dataSource.getSubjects());

  SubjectImplement(this.dataSource);
}
