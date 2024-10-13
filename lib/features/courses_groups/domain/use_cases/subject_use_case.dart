import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

import '../repositories/subject_repo.dart';

 class SubjectUseCase {
   SubjectRepo repo;
  Future<Either<Failure,ResponseModel>> getSubjects()async=>await repo.getSubjects();

   SubjectUseCase(this.repo);
}

