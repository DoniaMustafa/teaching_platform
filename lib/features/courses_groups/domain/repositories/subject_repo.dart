import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

abstract class SubjectRepo {
  Future<Either<Failure,ResponseModel>> getSubjects();
}

